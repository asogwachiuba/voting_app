import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voting_app/core/app/app.locator.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/firebase/authentication.dart';
import 'package:voting_app/models/user/votingapp_user.dart';
import 'package:voting_app/util/notification.dart';

class SettingsViewModel extends VotingAppViewmodel {
  /// Dependency injection =====================================================
  final authentication = locator<Authentication>();

  /// States and variables =====================================================
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final ninController = TextEditingController();

  File? _imageFile;
  File? get imageFile => _imageFile;
  set imageFile(File? newValue) {
    _imageFile = newValue;
    notifyListeners();
  }

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
    ninController.text = user?.nin ?? "";
  }

  takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  saveProfile() async {
    logger.d("Profile is saving");
    bool isUpdated = false;
    Map<String, dynamic> update = {};
    if (fullNameController.text.trim() != user?.fullName) {
      final name = <String, String>{'fullName': fullNameController.text.trim()};
      update.addEntries(name.entries);
      isUpdated = true;
    }

    if (ninController.text.trim() != user?.nin) {
      final nin = <String, String>{'nin': ninController.text.trim()};
      update.addEntries(nin.entries);
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
      final dob = <String, String>{'dateOfBirth': dobController.text.trim()};
      update.addEntries(dob.entries);
      isUpdated = true;
    }
    if (genderController.text.trim() != user?.gender) {
      final gender = <String, String>{'gender': genderController.text.trim()};
      update.addEntries(gender.entries);
      isUpdated = true;
    }

    if (imageFile != null) {
      String newProfileUrl =
          await authentication.changeProfilePicture(newProfilImage: imageFile!);
      final url = <String, String>{"profileImageUrl": newProfileUrl};
      update.addEntries(url.entries);
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
    imageFile = null;
    onReady();
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
    if (ninController.text.trim() != user?.nin) {
      isUpdated = true;
    }

    if (imageFile != null) {
      isUpdated = true;
    }

    if (!isUpdated) {
      AppNotification.notify(
          notificationMessage: "No changes were made to your profile");
    } else {
      onReady();
      imageFile = null;
      AppNotification.notify(
          notificationMessage: "Changes to your profile has been discarded");
    }
  }
}
