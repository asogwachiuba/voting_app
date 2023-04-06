import 'package:flutter/material.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/forgot_password/view/forgot_password_view.dart';
import 'package:voting_app/features/home/view/home_view.dart';
import 'package:voting_app/features/reset_password/view/reset_password_view.dart';

class LoginViewModel extends VotingAppViewmodel {
  /// States and variables =====================================================

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// ==========================================================================

  /// Methods ==================================================================

  toForgotPassword() {
    navigationService.navigateToView(const ForgotPasswordView());
  }

  toHome() {
    navigationService.navigateToView(const HomeView());
  }
}
