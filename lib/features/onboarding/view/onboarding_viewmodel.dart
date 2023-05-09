import 'package:flutter/material.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/login/view/login_view.dart';
import 'package:voting_app/features/register/view/register_view.dart';
import 'package:voting_app/gen/assets.gen.dart';

class OnboardingViewmodel extends VotingAppViewmodel {
  /// States and variables =====================================================
  final List<String> titles = [
    'Welcome to Voting App!',
    'Choose Your Candidates',
    'Cast Your Vote'
  ];
  final List<String> subtitles = [
    'Get ready to exercise your right to vote.',
    'Select your preferred candidates and learn more about them.',
    'Cast your vote and make your voice heard.'
  ];

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int newValue) {
    _currentIndex = newValue;
    notifyListeners();
  }

  /// ==========================================================================

  /// Methods ==================================================================
  void skip() {
    currentIndex = titles.length - 1;
    notifyListeners();
  }

  void next() {
    if (currentIndex < titles.length - 1) currentIndex = ++currentIndex;
    notifyListeners();
  }

  toLogin() {
    navigationService.navigateToView(const LoginView());
  }

  toRegister() {
    navigationService.navigateToView(const RegisterView());
  }

  /// ==========================================================================
}
