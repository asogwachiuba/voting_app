import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/login/view/login_view.dart';

class DashboardViewModel extends VotingAppViewmodel {
  /// Methods ==================================================================
  logOut() {
    navigationService.navigateToView(const LoginView());
  }
}
