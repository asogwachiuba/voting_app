import 'package:flutter/material.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/models/user/votingapp_user.dart';
import 'package:voting_app/util/notification.dart';

class SettingsViewModel extends VotingAppViewmodel {
  /// Dependency injection =====================================================

  /// States and variables =====================================================
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();

  VotingappUser? user;

  late String _email;
  String get email => _email;
  set email(String newValue) {
    _email = newValue;
    notifyListeners();
  }

  /// Methods ==================================================================

  onReady() {
    user = db.getCurrentUser();
    if (user == null) logger.d("No user data available");
    fullNameController.text = user?.fullName ?? "";
    email = user?.email ?? "";
    dobController.text = user?.dateOfBirth ?? "";
    genderController.text = user?.gender ?? "";
    phoneController.text = user?.phoneNumber ?? "";
  }

  saveProfile() {
    logger.d("Profile is saving");
    bool isUpdated = false;
    Map<String, dynamic> update = {};
    if (fullNameController.text.trim() != user?.fullName) {
      final name = <String, String>{'fullName': fullNameController.text.trim()};
      update.addEntries(name.entries);
      isUpdated = true;
    }

    if (phoneController.text.trim() != user?.phoneNumber) {
      final phone = <String, String>{
        'phoneNumber': fullNameController.text.trim()
      };
      update.addEntries(phone.entries);
      isUpdated = true;
    }
    if (dobController.text.trim() != user?.dateOfBirth) {
      final dob = <String, String>{
        'dateOfBirth': fullNameController.text.trim()
      };
      update.addEntries(dob.entries);
      isUpdated = true;
    }
    if (genderController.text.trim() != user?.gender) {
      final gender = <String, String>{'gender': fullNameController.text.trim()};
      update.addEntries(gender.entries);
      isUpdated = true;
    }

    if (!isUpdated) {
      AppNotification.notify(
          notificationMessage: "Your profile is already up to date");
      logger.d("Profile up to date");
      return;
    }

    db.updateUserProfile(
      update: update,
      notifyUser: true,
    );
    logger.d("Profile updated");
  }

  discard() {
    bool isUpdated = false;
    if (fullNameController.text.trim() != user?.fullName) {
      isUpdated = true;
    }

    if (phoneController.text.trim() != user?.phoneNumber) {
      isUpdated = true;
    }
    if (dobController.text.trim() != user?.dateOfBirth) {
      isUpdated = true;
    }
    if (genderController.text.trim() != user?.gender) {
      isUpdated = true;
    }

    if (!isUpdated) {
      AppNotification.notify(
          notificationMessage: "No changes were made to your profile");
    } else {
      onReady();
      AppNotification.notify(
          notificationMessage: "Changes to your profile has been discarded");
    }
  }
}
