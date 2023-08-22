import 'package:flutter/rendering.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:voting_app/features/accreditation/service/aws_service.dart';
import 'package:voting_app/features/candidate_options/view/candidate_options_view.dart';
import 'package:voting_app/features/election_info/view/election_info_view.dart';
import 'package:voting_app/features/election_options/view/election_options_view.dart';
import 'package:voting_app/features/forgot_password/view/forgot_password_view.dart';
import 'package:voting_app/features/home/view/home_view.dart';
import 'package:voting_app/features/login/view/login_view.dart';
import 'package:voting_app/features/onboarding/view/onboarding_view.dart';
import 'package:voting_app/features/register/view/register_view.dart';
import 'package:voting_app/features/registration_successful/view/registration_successful_view.dart';
import 'package:voting_app/features/reset_password/view/reset_password_view.dart';
import 'package:voting_app/features/result_options/view/result_options_view.dart';
import 'package:voting_app/features/result_select_local_government/view/result_select_local_government_view.dart';
import 'package:voting_app/features/result_select_state/view/result_select_state_view.dart';
import 'package:voting_app/features/select_local_government/view/select_local_government_view.dart';
import 'package:voting_app/features/select_state/view/select_state_view.dart';
import 'package:voting_app/features/view_candidates/view/view_candidates_view.dart';
import 'package:voting_app/features/view_result/view/view_result_view.dart';
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
  MaterialRoute(page: SelectStateView),
  MaterialRoute(page: SelectLocalGovernmentView),
  MaterialRoute(page: ResultOptionsView),
  MaterialRoute(page: ResultSelectStateView),
  MaterialRoute(page: ResultSelectLocalGovernmentView),
  MaterialRoute(page: ViewResultView),
  MaterialRoute(page: ElectionInfoView),
  MaterialRoute(page: RegistrationSuccessfulView),
], dependencies: [
  LazySingleton(classType: Authentication),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: Database),
  LazySingleton(classType: AwsService),
], logger: StackedLogger())
class AppSetup {}
