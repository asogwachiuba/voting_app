import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/login/view/login_view.dart';

class ForgotPasswordViewModel extends VotingAppViewmodel {
  toLogin() {
    navigationService.navigateToView(const LoginView());
  }
}
