import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/accreditation/view/accreditation_view.dart';
import 'package:voting_app/features/candidate_options/view/candidate_options_view.dart';
import 'package:voting_app/features/login/view/login_view.dart';

class DashboardViewModel extends VotingAppViewmodel {
  /// Methods ==================================================================
  logOut() {
    navigationService.navigateToView(const LoginView());
  }

  toAccreditation() {
    navigationService.navigateToView(const AccreditationView());
  }

  toCandidateOptions() {
    navigationService.navigateToView(const CandidateOptionsView());
  }
}
