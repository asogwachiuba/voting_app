import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:voting_app/constants/keys.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/firebase/database.dart';
import 'package:voting_app/models/user/voter.dart';
import 'package:voting_app/util/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  final firebaseAuth = FirebaseAuth.instance;
  final db = Database();

  logout() async {
    logger.d("I am logging out");
    await firebaseAuth.signOut();
    logger.d("Database is being cleaned");
    await db.nukeDb();
  }

  forgotPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    AppNotification.notify(
        notificationMessage:
            "Check your mail inbox [$email] to reset your password");
  }

  Future<bool> updatePassword({required String newPassword}) async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      AppNotification.error(error: "User is not logged in");
      return false;
    }
    await user.updatePassword(newPassword);
    return true;
  }

  // User needs to be logged in to confirm email verification status
  bool checkUserVerificationStatus() {
    bool? isVerified = firebaseAuth.currentUser?.emailVerified;
    if (isVerified == null || !isVerified) {
      _verifyEmail(email: firebaseAuth.currentUser?.email ?? "");
      logger.d("Validation mail was resent");
    }
    return isVerified ?? false;
  }

  Future<bool> login({required String email, required String password}) async {
    bool isSuccessful = false;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await db.getUserProfile(email: email);
      isSuccessful = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppNotification.error(
            error:
                'No user found for that email.\nRegister a new account to vote');
        isSuccessful = false;
      } else if (e.code == 'wrong-password') {
        AppNotification.error(error: 'Wrong password.');
        isSuccessful = false;
      }
    }

    return isSuccessful;
  }

  Future<String> changeProfilePicture({required File newProfilImage}) async {
    // deletes the current profile image
    final user = db.getCurrentUser();
    final fileName = user?.email;
    // For already exisiting users without profile picture, this avoids error
    // as there is no profile picture to delete.
    if (user?.profileImageUrl != null) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("Voters Profile Image/$fileName");
      await storageRef.delete();
    }

    // Uploads the new profile image
    final String newImageUrl = await uploadProfilePicture(
      profileImage: newProfilImage,
      email: fileName ?? "",
    );
    return newImageUrl;
  }

  Future<String> uploadProfilePicture(
      {required File profileImage, required String email}) async {
    final fileName = email;
    final storageRef =
        FirebaseStorage.instance.ref().child("Voters Profile Image/$fileName");
    final storageTaskSnapshot = await storageRef.putFile(profileImage);
    final downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<bool> register({
    required String email,
    required String phoneNumber,
    required String fullName,
    required String dateOfBirth,
    required String electionState,
    required String electionLocalGovernment,
    required String electionWard,
    required String electionPollingUnits,
    required bool isAmputee,
    required String nin,
    required String gender,
    required File profileImage,
  }) async {
    // create user with email and password
    bool createAccountSuccessful = await _createUserAccount(
      email: email,
      password: Keys.generalPassword, // The users initial account is general
    );

    // verify user email
    if (createAccountSuccessful) {
      await _verifyEmail(email: email);
    } else {
      return false;
    }

    // Get user profile image url after uploading to firebase storage
    String profileImageUrl =
        await uploadProfilePicture(profileImage: profileImage, email: email);

    // create user database
    bool userDatabaseCreated = await _createUserDatabase(
      email: email,
      phoneNumber: phoneNumber,
      fullName: fullName,
      dateOfBirth: dateOfBirth,
      electionState: electionState,
      electionLocalGovernment: electionLocalGovernment,
      electionWard: electionWard,
      electionPollingUnits: electionPollingUnits,
      isAmputee: isAmputee,
      nin: nin,
      gender: gender,
      profileImageUrl: profileImageUrl,
    );
    if (userDatabaseCreated) {
      await db.updateNINRegistrationStatus(nin: nin);
    }

    if (!userDatabaseCreated) return false;

    // save new user identifier with shared preference
    _saveUserFirstTimeStatus();

    // show registration success
    AppNotification.notify(notificationMessage: "Registration successful");
    return true;
  }

  Future<bool> _createUserAccount(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppNotification.error(error: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AppNotification.error(
            error: 'The account already exists for that email.');
      }
    } catch (e) {
      logger.e(e);
    }
    return false;
  }

  _verifyEmail({required String email}) async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      logger.d("User is not created yet");
    }
  }

  _createUserDatabase({
    required String email,
    required String phoneNumber,
    required String fullName,
    required String dateOfBirth,
    required String electionState,
    required String electionLocalGovernment,
    required String electionWard,
    required String electionPollingUnits,
    required bool isAmputee,
    required String nin,
    required String gender,
    required String profileImageUrl,
  }) async {
    final voter = Voter(
        email: email,
        fullName: fullName,
        nin: nin,
        phoneNumber: phoneNumber,
        profileImageUrl: profileImageUrl,
        electionState: electionState,
        electionLocalGovernment: electionLocalGovernment,
        electionWard: electionWard,
        electionPollingUnits: electionPollingUnits,
        gender: gender,
        isAmputee: isAmputee,
        isFirstTime: true,
        isVerified: false,
        dateOfBirth: dateOfBirth);

    bool isSuccessful = await db.createUserDatabase(voter: voter);
    return isSuccessful;
  }

  changeFirstTimeStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .setBool(Keys.isFirstTime, false)
        .whenComplete(() => logger.d("I am no more a first timer"))
        .onError((e, s) {
      logger.d("I am still a first timer. Reason $e");
      return false;
    });
  }

  _saveUserFirstTimeStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .setBool(Keys.isFirstTime, true)
        .whenComplete(() => logger.d("First timer saved"))
        .onError((e, s) {
      logger.d("First timer was lost. Reason $e");
      return false;
    });
  }
}
