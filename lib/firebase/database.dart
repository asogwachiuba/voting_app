import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:voting_app/constants/election_data.dart';
import 'package:voting_app/constants/keys.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/models/user/voter.dart';
import 'package:voting_app/models/user/votingapp_user.dart';
import 'package:voting_app/util/notification.dart';

class Database {
  final db = FirebaseFirestore.instance;

  /// Firestore database =======================================================

  /// Get's a user's profile with email
  Future<Voter?> getUserProfile({required String email}) async {
    Voter? voter;
    final docRef =
        db.collection("Voters").doc(FirebaseAuth.instance.currentUser?.uid);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.isNotEmpty) {
          voter = Voter.fromJson(data);
          saveCurrentUser(
              VotingappUser.fromSigninResponse(user: Voter.fromJson(data)));
        }
      },
      onError: (e) => logger.d("Error getting document: $e"),
    );
    return voter;
  }

  /// Get's candidates for presidential election
  Future<Map<String, dynamic>> getPresidentialCandidates() async {
    Map<String, dynamic> presidentialCandidates = {};
    await db
        .collection("Election Data")
        .doc("Presidential Candidates")
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.isNotEmpty) {
          presidentialCandidates = data;
          logger.d("Presidential candidates loading ......");
        }
      },
      onError: (e) => logger.d("Error getting presidential candidates: $e"),
    );
    return presidentialCandidates;
  }

  /// Get's candidates for governatorial election for state selected by user
  Future<Map<String, dynamic>> getGubernatorialCandidates(
      {required String state}) async {
    Map<String, dynamic> gubernatorialCandidates = {};
    await db
        .collection("Election Data")
        .doc("Gubernatorial Candidates")
        .collection(state)
        .doc(state)
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.isNotEmpty) {
          gubernatorialCandidates = data;
          logger.d("Gubernatorial candidates loading ......");
        }
      },
      onError: (e) => logger.d("Error getting presidential candidates: $e"),
    );
    return gubernatorialCandidates;
  }

  /// Checks a user voting status
  Future<bool> checkIfUserHasVoted(
      {required ELECTIONCATEGORY electioncategory}) async {
    bool hasUserVoted = false;
    VotingappUser? user = getCurrentUser();
    if (user != null) {
      switch (electioncategory) {
        case ELECTIONCATEGORY.presidential:
          hasUserVoted = user.hasVotedPresidential ?? false;
          break;
        case ELECTIONCATEGORY.gubernatorial:
          hasUserVoted = user.hasVotedGubernatorial ?? false;
          break;
        case ELECTIONCATEGORY.localGovernment:
          hasUserVoted = user.hasVotedLocalGovernment ?? false;
          break;
      }
    }
    return hasUserVoted;
  }

  /// Get's candidates for local government election for state selected by user
  Future<Map<String, dynamic>> getLocalGovernmentCandidates(
      {required String state, required String localGovernment}) async {
    Map<String, dynamic> localGovernmentCandidates = {};
    await db
        .collection("Election Data")
        .doc("Local Government Candidates")
        .collection(state.toUpperCase())
        .doc(localGovernment.toUpperCase())
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.isNotEmpty) {
          localGovernmentCandidates = data;
          logger.d("Local government candidates loading ......");
        }
      },
      onError: (e) => logger.d("Error getting presidential candidates: $e"),
    );
    return localGovernmentCandidates;
  }

  /// For sending data required to the database. Developer use only
  _sendLocalData({required Map<String, dynamic> data}) async {
    bool isSuccessful = false;
    // int stateIndex = 7;
    // ElectionData.pollingUnits.forEach((state) {
    //   logger.d("Found $state");
    //   state[ElectionData.states[stateIndex]].forEach((lga) async {
    //     logger.d("Found $lga");
    //     // update local govt parties
    //     await db
    //         .collection("Election Data")
    //         .doc("Local Government Candidates")
    //         .collection(ElectionData.states[stateIndex].toUpperCase())
    //         .doc(lga["local_government"].toString().toUpperCase())
    //         .set(data)
    //         .whenComplete(() {
    //       logger.d("${ElectionData.states[stateIndex]} data uploaded");
    //       isSuccessful = true;
    //     }).onError((error, stackTrace) {
    //       logger.d("Database error $e");
    //       isSuccessful = false;
    //     });
    //   });
    //   ++stateIndex;
    // });
    logger.d(ElectionData.pollingUnits[7].toString());
    ElectionData.pollingUnits[7]["Delta"]?.forEach((lga) async {
      await db
          .collection("Election Result")
          .doc("LocalGovernment".toUpperCase())
          .collection("Delta".toUpperCase())
          .doc(lga["local_government"].toString().toUpperCase())
          .set(data)
          .whenComplete(() => isSuccessful = true)
          .onError((error, stackTrace) {
        logger.d("Database error $e");
        isSuccessful = false;
      });
    });

    return isSuccessful;
  }

  Future<Map<String, dynamic>> getPresidentialResult(
      {required ELECTIONCATEGORY electioncategory}) async {
    Map<String, dynamic> result = {};
    await db
        .collection("Election Result")
        .doc(electioncategory.name.toUpperCase())
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.isNotEmpty) {
          result = data;
        }
      },
      onError: (e) => logger.d("Error getting presidential candidates: $e"),
    );
    return result;
  }

  Future<Map<String, dynamic>> getGubernatorialResult(
      {required ELECTIONCATEGORY electioncategory,
      required String state}) async {
    Map<String, dynamic> result = {};
    await db
        .collection("Election Result")
        .doc(electioncategory.name.toUpperCase())
        .collection(state.toUpperCase())
        .doc(state.toUpperCase())
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.isNotEmpty) {
          result = data;
        }
      },
      onError: (e) => logger.d("Error getting presidential candidates: $e"),
    );
    return result;
  }

  Future<Map<String, dynamic>> getLocalGovernmentResult({
    required ELECTIONCATEGORY electioncategory,
    required String state,
    required String localGovernment,
  }) async {
    Map<String, dynamic> result = {};
    await db
        .collection("Election Result")
        .doc(electioncategory.name.toUpperCase())
        .collection(state.toUpperCase())
        .doc(localGovernment.toUpperCase())
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.isNotEmpty) {
          result = data;
        }
      },
      onError: (e) => logger.d("Error getting presidential candidates: $e"),
    );
    return result;
  }

  Future<Map<String, dynamic>?> getElectionResult({
    required ELECTIONCATEGORY electioncategory,
    String? state,
    String? localGovernment,
  }) async {
    switch (electioncategory) {
      case ELECTIONCATEGORY.presidential:
        logger.d("Sucessful!!");
        return await getPresidentialResult(electioncategory: electioncategory);
      case ELECTIONCATEGORY.gubernatorial:
        if (state == null) {
          AppNotification.notify(
              notificationMessage:
                  "A state is needed to get gubernatorial result");
          return null;
        }
        logger.d("Sucessful!!");
        return await getGubernatorialResult(
            electioncategory: electioncategory, state: state);
      case ELECTIONCATEGORY.localGovernment:
        if (state == null || localGovernment == null) {
          AppNotification.notify(
              notificationMessage:
                  "A state and local government is needed to get local government result");
          return null;
        }
        logger.d("Sucessful!!");

        return await getLocalGovernmentResult(
            electioncategory: electioncategory,
            state: state,
            localGovernment: localGovernment);
    }
  }

  updateUserProfile({
    required Map<String, dynamic> update,
    bool notifyUser = false,
  }) {
    final washingtonRef =
        db.collection("Voters").doc(FirebaseAuth.instance.currentUser?.uid);
    washingtonRef.update(update).then((value) async {
      await getUserProfile(email: getCurrentUser()?.email ?? "");
      if (notifyUser) {
        AppNotification.notify(
            notificationMessage: "Profile updated successful");
      }
      logger.d("DocumentSnapshot successfully updated!");
    }, onError: (e) => logger.d("Error updating document $e"));
  }

  Future<bool> updatePresidentialVoteCount({
    required ELECTIONCATEGORY electioncategory,
    required String partyAcronym,
  }) async {
    bool isSuccessful = false;
    await FirebaseFirestore.instance
        .collection('Election Result')
        .doc(electioncategory.name.toUpperCase())
        .update({partyAcronym: FieldValue.increment(1)}).then((value) {
      isSuccessful = true;
      logger.d(
          "You voted successfully for $partyAcronym in ${electioncategory.name} election");
    }, onError: (e) => logger.d("Error updating document $e"));
    return isSuccessful;
  }

  Future<bool> updateGubernatorialVoteCount({
    required ELECTIONCATEGORY electioncategory,
    required String partyAcronym,
    required String state,
  }) async {
    bool isSuccessful = false;
    await FirebaseFirestore.instance
        .collection('Election Result')
        .doc(electioncategory.name.toUpperCase())
        .collection(state.toUpperCase())
        .doc(state.toUpperCase())
        .update({partyAcronym: FieldValue.increment(1)}).then((value) {
      isSuccessful = true;
      logger.d(
          "You voted successfully for $partyAcronym in ${electioncategory.name} election");
    }, onError: (e) => logger.d("Error updating document $e"));
    return isSuccessful;
  }

  Future<bool> updateLocalGovernmentVoteCount({
    required ELECTIONCATEGORY electioncategory,
    required String partyAcronym,
    required String state,
    required String localGovernment,
  }) async {
    bool isSuccessful = false;
    await FirebaseFirestore.instance
        .collection('Election Result')
        .doc(electioncategory.name.toUpperCase())
        .collection(state.toUpperCase())
        .doc(localGovernment.toUpperCase())
        .update({partyAcronym: FieldValue.increment(1)}).then((value) {
      isSuccessful = true;
      logger.d(
          "You voted successfully for $partyAcronym in ${electioncategory.name} election");
    }, onError: (e) => logger.d("Error updating document $e"));
    return isSuccessful;
  }

  Future<bool> createUserDatabase({required Voter voter}) async {
    bool isSuccessful = false;
    await db
        .collection("Voters")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(voter.toJson())
        .whenComplete(() => isSuccessful = true)
        .onError((error, stackTrace) {
      // This deletes a user account if account database was not successfuly created.
      // This makes a user able to register again if database had an issue
      FirebaseAuth.instance.currentUser?.delete();
      logger.d("Database error $e");
      isSuccessful = false;
    });

    saveCurrentUser(VotingappUser.fromSigninResponse(user: voter));
    return isSuccessful;
  }

  Future<bool> ninVerification({required String nin}) async {
    List ninRef = [];
    await db
        .collection("Election Data")
        .doc("NIN")
        .get()
        .then((value) => ninRef = value.data()?['nin']);
    if (ninRef.contains(nin)) {
      AppNotification.notify(notificationMessage: "Nin verified");
      return true;
    }
    logger.d("Am called");
    AppNotification.error(error: "Invalid Nin");
    return false;
  }

  Future<bool> vote({
    required ELECTIONCATEGORY electioncategory,
    required String partyAcronym,
    String? state,
    String? localGovernment,
  }) async {
    bool votedSuccessfully = false;

    switch (electioncategory) {
      case ELECTIONCATEGORY.presidential:
        // update party vote count
        votedSuccessfully = await updatePresidentialVoteCount(
          electioncategory: electioncategory,
          partyAcronym: partyAcronym,
        );
        // update user vote status
        if (votedSuccessfully) {
          Map<String, dynamic> update = {"hasVotedPresidential": true};
          updateUserProfile(update: update);
          // Updates user local data
          getUserProfile(email: getCurrentUser()?.email ?? "");
        }
        break;
      case ELECTIONCATEGORY.gubernatorial:
        if (state == null) {
          logger.d("You need a state to vote a state candidate");
          break;
        }
        // update party vote count
        votedSuccessfully = await updateGubernatorialVoteCount(
          electioncategory: electioncategory,
          partyAcronym: partyAcronym,
          state: state,
        );
        // update user vote status
        if (votedSuccessfully) {
          Map<String, dynamic> update = {"hasVotedGubernatorial": true};
          updateUserProfile(update: update);
          // Updates user local data
          getUserProfile(email: getCurrentUser()?.email ?? "");
        }
        break;
      case ELECTIONCATEGORY.localGovernment:
        if (state == null || localGovernment == null) {
          logger.d(
              "You need a state and local government to vote a local government candidate");
          break;
        }
        // update party vote count
        votedSuccessfully = await updateLocalGovernmentVoteCount(
          electioncategory: electioncategory,
          partyAcronym: partyAcronym,
          state: state,
          localGovernment: localGovernment,
        );
        // update user vote status
        if (votedSuccessfully) {
          Map<String, dynamic> update = {"hasVotedLocalGovernment": true};
          updateUserProfile(update: update);
          // Updates user local data
          getUserProfile(email: getCurrentUser()?.email ?? "");
        }
        break;
    }
    return votedSuccessfully;
  }

  Future<Map<String, dynamic>?> getUserNinDatabaseProfile(
      {required String nin}) async {
    try {
      Map<String, dynamic> userDatabaseInfo = {};
      await db
          .collection("Election Data")
          .doc("NIN")
          .get()
          .then((value) => userDatabaseInfo = value.data()?['ninDatabase'][nin]);
      return userDatabaseInfo;
    } catch(e) {
      logger.e(e.toString());

      return null;
    }

  }

  /// Updates NIN profile once a user has registered with it
  updateNINRegistrationStatus({required String nin}) {
    final ninDatabaseRef = db.collection("Election Data").doc('NIN');
    ninDatabaseRef.update(
      {
        'ninDatabase.$nin.isRegisteredVoter': true,
      },
    ).then((value) => logger.d("I am now a registered voter with $nin"));
  }

  /// Local database ===========================================================

  Future initializeDb() async {
    await Hive.initFlutter();
    Hive.registerAdapter<VotingappUser>(VotingappUserAdapter());

    await Hive.openBox<VotingappUser>(Keys.currentUserBoxName);
    await _sendLocalData(data: ElectionData.result);
    // await vote(
    //     electioncategory: ELECTIONCATEGORY.presidential, partyAcronym: Keys.lp);
    // await vote(
    //     electioncategory: ELECTIONCATEGORY.gubernatorial,
    //     partyAcronym: Keys.lp,
    //     state: "Lagos");
    // await vote(
    //     electioncategory: ELECTIONCATEGORY.localGovernment,
    //     partyAcronym: Keys.lp,
    //     state: "Lagos",
    //     localGovernment: "Agege");
  }

  //To be used when a different User wants to login
  Future nukeDb() async {
    Box<VotingappUser> currentUserBox = Hive.box(Keys.currentUserBoxName);
    await currentUserBox.clear();
  }

  Future saveCurrentUser(VotingappUser votingappUser) async {
    try {
      Box<VotingappUser> currentUserBox = Hive.box(Keys.currentUserBoxName);

      ///must contain only one user
      await currentUserBox.clear();
      currentUserBox.add(votingappUser);
      logger.d('${votingappUser.fullName} was successfully saved.');
    } catch (e) {
      logger.e("DB error: $e");
    }
  }

  VotingappUser? getCurrentUser() {
    Box<VotingappUser> currentUserBox = Hive.box(Keys.currentUserBoxName);
    return currentUserBox.values.isNotEmpty
        ? currentUserBox.values.first
        : null;
  }
}
