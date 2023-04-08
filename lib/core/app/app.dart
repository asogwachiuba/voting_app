import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:voting_app/features/candidate_options/view/candidate_options_view.dart';
import 'package:voting_app/features/election_options/view/election_options_view.dart';
import 'package:voting_app/features/forgot_password/view/forgot_password_view.dart';
import 'package:voting_app/features/home/view/home_view.dart';
import 'package:voting_app/features/login/view/login_view.dart';
import 'package:voting_app/features/onboarding/view/onboarding_view.dart';
import 'package:voting_app/features/register/view/register_view.dart';
import 'package:voting_app/features/reset_password/view/reset_password_view.dart';
import 'package:voting_app/features/view_candidates/view/view_candidates_view.dart';
import 'package:voting_app/features/voting/view/cast_vote_view.dart';
import 'package:voting_app/features/voting_success/view/voting_success_view.dart';
import 'package:voting_app/firebase/authentication.dart';
import 'package:voting_app/firebase/database.dart';

@StackedApp(routes: [
  MaterialRoute(page: OnboardingView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: ResetPasswordView),
  MaterialRoute(page: RegisterView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: ForgotPasswordView),
  MaterialRoute(page: ElectionOptionsView),
  MaterialRoute(page: CastVoteView),
  MaterialRoute(page: CandidateOptionsView),
  MaterialRoute(page: ViewCandidatesView),
  MaterialRoute(page: VotingSuccessView),
], dependencies: [
  LazySingleton(classType: Authentication),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: Database),
], logger: StackedLogger())
class AppSetup {}
