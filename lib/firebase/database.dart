import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:voting_app/constants/keys.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/models/user/voter.dart';
import 'package:voting_app/models/user/votingapp_user.dart';
import 'package:voting_app/util/notification.dart';

class Database {
  final db = FirebaseFirestore.instance;

  /// Firestore database =======================================================

  Future<Voter?> getUserProfile({required String email}) async {
    Voter? voter;
    final docRef =
        db.collection("Voters").doc(FirebaseAuth.instance.currentUser?.uid);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data != null) {
          voter = Voter.fromJson(data);
          saveCurrentUser(
              VotingappUser.fromSigninResponse(user: Voter.fromJson(data)));
        }
      },
      onError: (e) => logger.d("Error getting document: $e"),
    );
    return voter;
  }

  updateUserProfile({
    required Map<String, dynamic> update,
    bool notifyUser = false,
  }) {
    final washingtonRef =
        db.collection("Voters").doc(FirebaseAuth.instance.currentUser?.uid);
    washingtonRef.update(update).then((value) {
      if (notifyUser) {
        AppNotification.notify(
            notificationMessage: "Profile updated successful");
      }
      logger.d("DocumentSnapshot successfully updated!");
    }, onError: (e) => logger.d("Error updating document $e"));
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

  /// Local database ===========================================================

  Future initializeDb() async {
    await Hive.initFlutter();
    Hive.registerAdapter<VotingappUser>(VotingappUserAdapter());

    await Hive.openBox<VotingappUser>(Keys.currentUserBoxName);
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
    logger.d(
        '${currentUserBox.values.first.fullName} personal details was retrieved successfully');
    return currentUserBox.values.isNotEmpty
        ? currentUserBox.values.first
        : null;
  }
}
