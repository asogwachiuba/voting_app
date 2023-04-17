import 'package:flutter/services.dart';
import 'package:image_compare/image_compare.dart';
import 'package:local_auth/local_auth.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/election_options/view/election_options_view.dart';
import 'package:voting_app/gen/assets.gen.dart';

class AccreditationViewModel extends VotingAppViewmodel {
  /// States and variables =====================================================

  final localAuthentication = LocalAuthentication();

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool newValue) {
    _isAuthenticated = newValue;
    notifyListeners();
  }

  bool _ninIsVerified = false;
  bool get ninIsVerified => _ninIsVerified;
  set ninIsVerified(bool newValue) {
    _ninIsVerified = newValue;
    notifyListeners();
  }

  //  Both images differs
  // var a = Uri.parse(
  //     'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t30_sample-images03.jpg');
  // var b = Uri.parse(
  //     'https://hs.sbcounty.gov/cn/Photo%20Gallery/Sample%20Picture%20-%20Koala.jpg');

  // TODO: should be gotten from user info
  bool _isAmputee = false;
  bool get isAmputee => _isAmputee;
  set isAmputee(bool newValue) {
    _isAmputee = newValue;
    notifyListeners();
  }

  /// Methods ==================================================================
  // compare() async {
  //   var result = await compareImages(
  //     src1: a,
  //     src2: b,
  //     // algorithm: IMED(blurRatio: 0.001),
  //   );
  //   logger.d("The result is $result");
  // }

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

  validateNIN({required String nin}) async {
    if (nin.length == 11 && !ninIsVerified) {
      ninIsVerified = await db.ninVerification(nin: nin);
    }
  }

  toElectionOptions() {
    navigationService.navigateToView(const ElectionOptionsView());
  }

  back() {
    navigationService.back();
  }
}
