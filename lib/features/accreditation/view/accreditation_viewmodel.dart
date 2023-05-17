import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/election_options/view/election_options_view.dart';
import 'package:voting_app/util/notification.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class AccreditationViewModel extends VotingAppViewmodel {
  /// States and variables =====================================================

  final localAuthentication = LocalAuthentication();

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool newValue) {
    _isAuthenticated = newValue;
    notifyListeners();
  }

  int _currentStep = 0;
  int get currentStep => _currentStep;
  set currentStep(int newValue) {
    _currentStep = newValue;
    notifyListeners();
  }

  bool _ninIsVerified = false;
  bool get ninIsVerified => _ninIsVerified;
  set ninIsVerified(bool newValue) {
    _ninIsVerified = newValue;
    notifyListeners();
  }

  bool _isAmputee = false;
  bool get isAmputee => _isAmputee;
  set isAmputee(bool newValue) {
    _isAmputee = newValue;
    notifyListeners();
  }

  bool _hasFaceId = false;
  bool get hasFaceId => _hasFaceId;
  set hasFaceId(bool newValue) {
    _hasFaceId = newValue;
    notifyListeners();
  }

  /// Methods ==================================================================

  onReady() {
    final user = db.getCurrentUser();
    isAmputee = user?.isAmputee ?? false;
  }

  authenticate() async {
    if (isAuthenticated) {
      return; // User is already authenticated, so no need to authenticate again
    }
    isFaceIdAvaiable();

    // Uses face ID if available
    if (hasFaceId) {
      faceAuthentication();
      return;
    }
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

  faceAuthentication() async {
    if (isAuthenticated) return;
    try {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Please validate with your face',
        options: const AuthenticationOptions(
          useErrorDialogs: false,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        AppNotification.error(
            error:
                "Your device does not support face verification. Please use another device");
      } else if (e.code == auth_error.notEnrolled) {
        AppNotification.error(
            error:
                "Setup your face verification in your device to enable you register.");
      } else {
        AppNotification.error(error: "Authentication failed, try again.");
      }
    }
  }

  isFaceIdAvaiable() async {
    final List<BiometricType> availableBiometrics =
        await localAuthentication.getAvailableBiometrics();

    logger.d(availableBiometrics.toString());

    if (availableBiometrics.contains(BiometricType.face)) {
      hasFaceId = true;
      logger.d(availableBiometrics.toString());
      return;
    }

    AppNotification.error(error: 'No Face ID setup');
  }

  validateNIN({required String nin}) async {
    if (nin.length == 11 && !ninIsVerified) {
      ninIsVerified = (nin == db.getCurrentUser()?.nin);
      if (!ninIsVerified) {
        AppNotification.error(error: "Incorrect NIN, try again");
      }
    }
  }

  toElectionOptions() {
    navigationService.navigateToView(const ElectionOptionsView());
  }

  back() {
    navigationService.back();
  }

  toNextStep() {
    currentStep++;
  }
}
