import 'package:flutter/material.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';

class ResetPasswordViewmodel extends VotingAppViewmodel {
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

  onReady() {
    createPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

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

  Map<String, dynamic> checkPasswordStrength() {
    var result = {
      "message": "",
      "color": Colors.red,
    };

    if (createPasswordController.text.isEmpty ||
        validatePassword()['colors'] != Colors.white) {
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
