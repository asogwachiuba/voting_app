import 'package:flutter/material.dart';
import 'package:voting_app/core/app/app.locator.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/login/view/login_view.dart';
import 'package:voting_app/firebase/authentication.dart';
import 'package:voting_app/util/notification.dart';

class ForgotPasswordViewModel extends VotingAppViewmodel {
  final auth = locator<Authentication>();
  final emailController = TextEditingController();
  toLogin() {
    navigationService.navigateToView(const LoginView());
  }

  forgotPassowrd() async {
    if (emailController.text.isEmpty) {
      AppNotification.error(error: "Enter your registered email");
      return;
    }
    await auth.forgotPassword(email: emailController.text);
    toLogin();
  }
}
