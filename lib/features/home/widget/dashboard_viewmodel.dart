import 'package:voting_app/core/app/app.locator.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/accreditation/view/accreditation_view.dart';
import 'package:voting_app/features/candidate_options/view/candidate_options_view.dart';
import 'package:voting_app/features/election_info/view/election_info_view.dart';
import 'package:voting_app/features/login/view/login_view.dart';
import 'package:voting_app/features/result_options/view/result_options_view.dart';
import 'package:voting_app/firebase/authentication.dart';
import 'package:voting_app/models/user/votingapp_user.dart';

class DashboardViewModel extends VotingAppViewmodel {
  /// Dependency injection =====================================================
  final authentication = locator<Authentication>();

  /// States and variables =====================================================
  VotingappUser? user;

  /// Methods ==================================================================
  logOut() async {
    await authentication.logout();
    logger.d("I am navigating back");
    navigationService.back();
  }

  onReady() {
    user = db.getCurrentUser();
  }

  toAccreditation() {
    navigationService.navigateToView(const AccreditationView());
  }

  toCandidateOptions() {
    navigationService.navigateToView(const CandidateOptionsView());
  }

  toResultOption() {
    navigationService.navigateToView(const ResultOptionsView());
  }

  toElectionInfo() {
    navigationService.navigateToView(const ElectionInfoView());
  }
}
