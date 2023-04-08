import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/election_options/view/election_options_view.dart';

class AccreditationViewModel extends VotingAppViewmodel {
  /// States and variables =====================================================

  final localAuthentication = LocalAuthentication();

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool newValue) {
    _isAuthenticated = newValue;
    notifyListeners();
  }

  // TODO: should be gotten from user info
  bool _isAmputee = false;
  bool get isAmputee => _isAmputee;
  set isAmputee(bool newValue) {
    _isAmputee = newValue;
    notifyListeners();
  }

  /// Methods ==================================================================
  authenticate() async {
    if (isAuthenticated) return;
    try {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: isAmputee
            ? 'Provide your device password for election validation'
            : 'Provide your fingerprint for election validation',
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: !isAmputee,
        ),
      );
    } on PlatformException catch (e) {
      logger.d('Error: $e');
    }
  }

  toElectionOptions() {
    navigationService.navigateToView(const ElectionOptionsView());
  }

  back() {
    navigationService.back();
  }
}
