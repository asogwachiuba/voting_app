import 'package:flutter/material.dart';
import 'package:voting_app/core/app/app.locator.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/firebase/authentication.dart';
import 'package:voting_app/util/notification.dart';

class ResetPasswordViewmodel extends VotingAppViewmodel {
  /// Dependency injection =====================================================

  final authentication = locator<Authentication>();

  /// States and variables =====================================================

  late TextEditingController createPasswordController;
  late TextEditingController confirmPasswordController;

  bool _createPasswordVisibility = true;
  bool get createPasswordVisibility => _createPasswordVisibility;
  set createPasswordVisibility(bool newValue) {
    _createPasswordVisibility = newValue;
    notifyListeners();
  }

  bool _confirmPasswordVisibility = true;
  bool get confirmPasswordVisibility => _confirmPasswordVisibility;
  set confirmPasswordVisibility(bool newValue) {
    _confirmPasswordVisibility = newValue;
    notifyListeners();
  }

  /// ==========================================================================

  /// Methods ==================================================================

  updatePassword() async {
    if (checkPasswordSimilarity()['color'] != Colors.white) {
      AppNotification.error(error: checkPasswordSimilarity()['color']);
      return;
    }
    if (validatePassword()['color'] != Colors.white) {
      AppNotification.error(error: validatePassword()['message']);
      return;
    }
    bool isSuccessful = await authentication.updatePassword(
        newPassword: createPasswordController.text.trim());
    if (!isSuccessful) {
      AppNotification.error(error: "Password update was not successful.");
      return;
    }
    await db.updateUserProfile(update: {
      'isFirstTime': false,
      'isVerified': true,
    });
    await authentication.changeFirstTimeStatus();
    await authentication.logout();
    toLogin();
  }

  toLogin() {
    navigationService.back();
  }

  onReady() {
    createPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  // Returns a white color if password is valid
  Map<String, dynamic> validatePassword() {
    var result = {
      "message": "",
      "color": Colors.red,
    };
    if (createPasswordController.text.isEmpty) {
      result["message"] = "Please enter your new password";
      return result;
    }

    if (createPasswordController.text.length < 8) {
      result["message"] =
          "Password is too short. Remaining ${8 - createPasswordController.text.length} characters";
      return result;
    }

    if (!createPasswordController.text.contains(RegExp(r'[0-9]'))) {
      result["message"] = "Add a Number to your password";
      return result;
    }

    if (!createPasswordController.text.contains(RegExp(r'[A-Z]'))) {
      result["message"] = "Add an Uppercase letter to your password";
      return result;
    }

    if (!createPasswordController.text.contains(RegExp(r'[a-z]'))) {
      result["message"] = "Add an Lowercase letter to your password";
      return result;
    }

    if (!createPasswordController.text.contains(RegExp(r'[a-z]'))) {
      result["message"] = "Add an Lowercase letter to your password";
      return result;
    }

    if (!createPasswordController.text.contains(RegExp(r'[=!&@#%.]'))) {
      result["message"] = "Add a Special character to your password";
      return result;
    }

    // Success output
    result['message'] = 'Your password is now strong';
    result['color'] = Colors.white;
    return result;
  }

  Map<String, dynamic> checkPasswordSimilarity() {
    var result = {
      "message": "",
      "color": Colors.red,
    };

    if (createPasswordController.text.isEmpty) {
      result['message'] = "Create your new password";
      return result;
    }

    if (confirmPasswordController.text.isEmpty) {
      result['message'] = "Confirm Your password ";
      return result;
    }

    if (confirmPasswordController.text != createPasswordController.text) {
      result["message"] = "Both passwords don't match !";
      return result;
    }

    // Success output
    result['message'] = "Perfect, you can now reset your password";
    result['color'] = Colors.white;
    return result;
  }

  /// ==========================================================================
}
