// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i21;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' as _i22;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i25;
import 'package:voting_app/features/candidate_options/view/candidate_options_view.dart'
    as _i10;
import 'package:voting_app/features/election_info/view/election_info_view.dart'
    as _i19;
import 'package:voting_app/features/election_options/view/election_options_view.dart'
    as _i8;
import 'package:voting_app/features/forgot_password/view/forgot_password_view.dart'
    as _i7;
import 'package:voting_app/features/home/view/home_view.dart' as _i6;
import 'package:voting_app/features/login/view/login_view.dart' as _i3;
import 'package:voting_app/features/onboarding/view/onboarding_view.dart'
    as _i2;
import 'package:voting_app/features/register/view/register_view.dart' as _i5;
import 'package:voting_app/features/registration_successful/view/registration_successful_view.dart'
    as _i20;
import 'package:voting_app/features/reset_password/view/reset_password_view.dart'
    as _i4;
import 'package:voting_app/features/result_options/view/result_options_view.dart'
    as _i15;
import 'package:voting_app/features/result_select_local_government/view/result_select_local_government_view.dart'
    as _i17;
import 'package:voting_app/features/result_select_state/view/result_select_state_view.dart'
    as _i16;
import 'package:voting_app/features/select_local_government/view/select_local_government_view.dart'
    as _i14;
import 'package:voting_app/features/select_state/view/select_state_view.dart'
    as _i13;
import 'package:voting_app/features/view_candidates/view/view_candidates_view.dart'
    as _i11;
import 'package:voting_app/features/view_result/view/view_result_view.dart'
    as _i18;
import 'package:voting_app/features/voting/view/cast_vote_view.dart' as _i9;
import 'package:voting_app/features/voting_success/view/voting_success_view.dart'
    as _i12;
import 'package:voting_app/models/enums/election_category.dart' as _i23;
import 'package:voting_app/models/user/votingapp_user.dart' as _i24;

class Routes {
  static const onboardingView = '/';

  static const loginView = '/login-view';

  static const resetPasswordView = '/reset-password-view';

  static const registerView = '/register-view';

  static const homeView = '/home-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const electionOptionsView = '/election-options-view';

  static const castVoteView = '/cast-vote-view';

  static const candidateOptionsView = '/candidate-options-view';

  static const viewCandidatesView = '/view-candidates-view';

  static const votingSuccessView = '/voting-success-view';

  static const selectStateView = '/select-state-view';

  static const selectLocalGovernmentView = '/select-local-government-view';

  static const resultOptionsView = '/result-options-view';

  static const resultSelectStateView = '/result-select-state-view';

  static const resultSelectLocalGovernmentView =
      '/result-select-local-government-view';

  static const viewResultView = '/view-result-view';

  static const electionInfoView = '/election-info-view';

  static const registrationSuccessfulView = '/registration-successful-view';

  static const all = <String>{
    onboardingView,
    loginView,
    resetPasswordView,
    registerView,
    homeView,
    forgotPasswordView,
    electionOptionsView,
    castVoteView,
    candidateOptionsView,
    viewCandidatesView,
    votingSuccessView,
    selectStateView,
    selectLocalGovernmentView,
    resultOptionsView,
    resultSelectStateView,
    resultSelectLocalGovernmentView,
    viewResultView,
    electionInfoView,
    registrationSuccessfulView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i2.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.resetPasswordView,
      page: _i4.ResetPasswordView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i5.RegisterView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i6.HomeView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i7.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.electionOptionsView,
      page: _i8.ElectionOptionsView,
    ),
    _i1.RouteDef(
      Routes.castVoteView,
      page: _i9.CastVoteView,
    ),
    _i1.RouteDef(
      Routes.candidateOptionsView,
      page: _i10.CandidateOptionsView,
    ),
    _i1.RouteDef(
      Routes.viewCandidatesView,
      page: _i11.ViewCandidatesView,
    ),
    _i1.RouteDef(
      Routes.votingSuccessView,
      page: _i12.VotingSuccessView,
    ),
    _i1.RouteDef(
      Routes.selectStateView,
      page: _i13.SelectStateView,
    ),
    _i1.RouteDef(
      Routes.selectLocalGovernmentView,
      page: _i14.SelectLocalGovernmentView,
    ),
    _i1.RouteDef(
      Routes.resultOptionsView,
      page: _i15.ResultOptionsView,
    ),
    _i1.RouteDef(
      Routes.resultSelectStateView,
      page: _i16.ResultSelectStateView,
    ),
    _i1.RouteDef(
      Routes.resultSelectLocalGovernmentView,
      page: _i17.ResultSelectLocalGovernmentView,
    ),
    _i1.RouteDef(
      Routes.viewResultView,
      page: _i18.ViewResultView,
    ),
    _i1.RouteDef(
      Routes.electionInfoView,
      page: _i19.ElectionInfoView,
    ),
    _i1.RouteDef(
      Routes.registrationSuccessfulView,
      page: _i20.RegistrationSuccessfulView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.OnboardingView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.OnboardingView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.ResetPasswordView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ResetPasswordView(),
        settings: data,
      );
    },
    _i5.RegisterView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.RegisterView(),
        settings: data,
      );
    },
    _i6.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.HomeView(key: args.key),
        settings: data,
      );
    },
    _i7.ForgotPasswordView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ForgotPasswordView(),
        settings: data,
      );
    },
    _i8.ElectionOptionsView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ElectionOptionsView(),
        settings: data,
      );
    },
    _i9.CastVoteView: (data) {
      final args = data.getArgs<CastVoteViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.CastVoteView(
            key: args.key, electionCategory: args.electionCategory),
        settings: data,
      );
    },
    _i10.CandidateOptionsView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.CandidateOptionsView(),
        settings: data,
      );
    },
    _i11.ViewCandidatesView: (data) {
      final args = data.getArgs<ViewCandidatesViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.ViewCandidatesView(
            key: args.key,
            electionCategory: args.electionCategory,
            selectedLocalGovernment: args.selectedLocalGovernment,
            selectedState: args.selectedState),
        settings: data,
      );
    },
    _i12.VotingSuccessView: (data) {
      final args = data.getArgs<VotingSuccessViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.VotingSuccessView(
            key: args.key,
            selectedCandidateImgUrl: args.selectedCandidateImgUrl,
            selectedCandidateName: args.selectedCandidateName,
            selectedCandidateParty: args.selectedCandidateParty,
            user: args.user),
        settings: data,
      );
    },
    _i13.SelectStateView: (data) {
      final args = data.getArgs<SelectStateViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.SelectStateView(
            key: args.key, electioncategory: args.electioncategory),
        settings: data,
      );
    },
    _i14.SelectLocalGovernmentView: (data) {
      final args =
          data.getArgs<SelectLocalGovernmentViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.SelectLocalGovernmentView(
            key: args.key,
            electioncategory: args.electioncategory,
            selectedState: args.selectedState),
        settings: data,
      );
    },
    _i15.ResultOptionsView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.ResultOptionsView(),
        settings: data,
      );
    },
    _i16.ResultSelectStateView: (data) {
      final args = data.getArgs<ResultSelectStateViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.ResultSelectStateView(
            key: args.key, electioncategory: args.electioncategory),
        settings: data,
      );
    },
    _i17.ResultSelectLocalGovernmentView: (data) {
      final args =
          data.getArgs<ResultSelectLocalGovernmentViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.ResultSelectLocalGovernmentView(
            key: args.key,
            electioncategory: args.electioncategory,
            selectedState: args.selectedState),
        settings: data,
      );
    },
    _i18.ViewResultView: (data) {
      final args = data.getArgs<ViewResultViewArguments>(nullOk: false);
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => _i18.ViewResultView(
            key: args.key,
            electionCategory: args.electionCategory,
            selectedLocalGovernment: args.selectedLocalGovernment,
            selectedState: args.selectedState),
        settings: data,
      );
    },
    _i19.ElectionInfoView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.ElectionInfoView(),
        settings: data,
      );
    },
    _i20.RegistrationSuccessfulView: (data) {
      return _i21.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.RegistrationSuccessfulView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CastVoteViewArguments {
  const CastVoteViewArguments({
    this.key,
    required this.electionCategory,
  });

  final _i22.Key? key;

  final _i23.ELECTIONCATEGORY electionCategory;

  @override
  String toString() {
    return '{"key": "$key", "electionCategory": "$electionCategory"}';
  }

  @override
  bool operator ==(covariant CastVoteViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.electionCategory == electionCategory;
  }

  @override
  int get hashCode {
    return key.hashCode ^ electionCategory.hashCode;
  }
}

class ViewCandidatesViewArguments {
  const ViewCandidatesViewArguments({
    this.key,
    required this.electionCategory,
    this.selectedLocalGovernment,
    this.selectedState,
  });

  final _i22.Key? key;

  final _i23.ELECTIONCATEGORY electionCategory;

  final String? selectedLocalGovernment;

  final String? selectedState;

  @override
  String toString() {
    return '{"key": "$key", "electionCategory": "$electionCategory", "selectedLocalGovernment": "$selectedLocalGovernment", "selectedState": "$selectedState"}';
  }

  @override
  bool operator ==(covariant ViewCandidatesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.electionCategory == electionCategory &&
        other.selectedLocalGovernment == selectedLocalGovernment &&
        other.selectedState == selectedState;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        electionCategory.hashCode ^
        selectedLocalGovernment.hashCode ^
        selectedState.hashCode;
  }
}

class VotingSuccessViewArguments {
  const VotingSuccessViewArguments({
    this.key,
    required this.selectedCandidateImgUrl,
    required this.selectedCandidateName,
    required this.selectedCandidateParty,
    required this.user,
  });

  final _i22.Key? key;

  final String selectedCandidateImgUrl;

  final String selectedCandidateName;

  final String selectedCandidateParty;

  final _i24.VotingappUser user;

  @override
  String toString() {
    return '{"key": "$key", "selectedCandidateImgUrl": "$selectedCandidateImgUrl", "selectedCandidateName": "$selectedCandidateName", "selectedCandidateParty": "$selectedCandidateParty", "user": "$user"}';
  }

  @override
  bool operator ==(covariant VotingSuccessViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.selectedCandidateImgUrl == selectedCandidateImgUrl &&
        other.selectedCandidateName == selectedCandidateName &&
        other.selectedCandidateParty == selectedCandidateParty &&
        other.user == user;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        selectedCandidateImgUrl.hashCode ^
        selectedCandidateName.hashCode ^
        selectedCandidateParty.hashCode ^
        user.hashCode;
  }
}

class SelectStateViewArguments {
  const SelectStateViewArguments({
    this.key,
    required this.electioncategory,
  });

  final _i22.Key? key;

  final _i23.ELECTIONCATEGORY electioncategory;

  @override
  String toString() {
    return '{"key": "$key", "electioncategory": "$electioncategory"}';
  }

  @override
  bool operator ==(covariant SelectStateViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.electioncategory == electioncategory;
  }

  @override
  int get hashCode {
    return key.hashCode ^ electioncategory.hashCode;
  }
}

class SelectLocalGovernmentViewArguments {
  const SelectLocalGovernmentViewArguments({
    this.key,
    required this.electioncategory,
    required this.selectedState,
  });

  final _i22.Key? key;

  final _i23.ELECTIONCATEGORY electioncategory;

  final String selectedState;

  @override
  String toString() {
    return '{"key": "$key", "electioncategory": "$electioncategory", "selectedState": "$selectedState"}';
  }

  @override
  bool operator ==(covariant SelectLocalGovernmentViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.electioncategory == electioncategory &&
        other.selectedState == selectedState;
  }

  @override
  int get hashCode {
    return key.hashCode ^ electioncategory.hashCode ^ selectedState.hashCode;
  }
}

class ResultSelectStateViewArguments {
  const ResultSelectStateViewArguments({
    this.key,
    required this.electioncategory,
  });

  final _i22.Key? key;

  final _i23.ELECTIONCATEGORY electioncategory;

  @override
  String toString() {
    return '{"key": "$key", "electioncategory": "$electioncategory"}';
  }

  @override
  bool operator ==(covariant ResultSelectStateViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.electioncategory == electioncategory;
  }

  @override
  int get hashCode {
    return key.hashCode ^ electioncategory.hashCode;
  }
}

class ResultSelectLocalGovernmentViewArguments {
  const ResultSelectLocalGovernmentViewArguments({
    this.key,
    required this.electioncategory,
    required this.selectedState,
  });

  final _i22.Key? key;

  final _i23.ELECTIONCATEGORY electioncategory;

  final String selectedState;

  @override
  String toString() {
    return '{"key": "$key", "electioncategory": "$electioncategory", "selectedState": "$selectedState"}';
  }

  @override
  bool operator ==(covariant ResultSelectLocalGovernmentViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.electioncategory == electioncategory &&
        other.selectedState == selectedState;
  }

  @override
  int get hashCode {
    return key.hashCode ^ electioncategory.hashCode ^ selectedState.hashCode;
  }
}

class ViewResultViewArguments {
  const ViewResultViewArguments({
    this.key,
    required this.electionCategory,
    this.selectedLocalGovernment,
    this.selectedState,
  });

  final _i22.Key? key;

  final _i23.ELECTIONCATEGORY electionCategory;

  final String? selectedLocalGovernment;

  final String? selectedState;

  @override
  String toString() {
    return '{"key": "$key", "electionCategory": "$electionCategory", "selectedLocalGovernment": "$selectedLocalGovernment", "selectedState": "$selectedState"}';
  }

  @override
  bool operator ==(covariant ViewResultViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.electionCategory == electionCategory &&
        other.selectedLocalGovernment == selectedLocalGovernment &&
        other.selectedState == selectedState;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        electionCategory.hashCode ^
        selectedLocalGovernment.hashCode ^
        selectedState.hashCode;
  }
}

extension NavigatorStateExtension on _i25.NavigationService {
  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView({
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToElectionOptionsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.electionOptionsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCastVoteView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electionCategory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.castVoteView,
        arguments:
            CastVoteViewArguments(key: key, electionCategory: electionCategory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCandidateOptionsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.candidateOptionsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewCandidatesView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electionCategory,
    String? selectedLocalGovernment,
    String? selectedState,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.viewCandidatesView,
        arguments: ViewCandidatesViewArguments(
            key: key,
            electionCategory: electionCategory,
            selectedLocalGovernment: selectedLocalGovernment,
            selectedState: selectedState),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVotingSuccessView({
    _i22.Key? key,
    required String selectedCandidateImgUrl,
    required String selectedCandidateName,
    required String selectedCandidateParty,
    required _i24.VotingappUser user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.votingSuccessView,
        arguments: VotingSuccessViewArguments(
            key: key,
            selectedCandidateImgUrl: selectedCandidateImgUrl,
            selectedCandidateName: selectedCandidateName,
            selectedCandidateParty: selectedCandidateParty,
            user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSelectStateView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electioncategory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.selectStateView,
        arguments: SelectStateViewArguments(
            key: key, electioncategory: electioncategory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSelectLocalGovernmentView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electioncategory,
    required String selectedState,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.selectLocalGovernmentView,
        arguments: SelectLocalGovernmentViewArguments(
            key: key,
            electioncategory: electioncategory,
            selectedState: selectedState),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResultOptionsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resultOptionsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResultSelectStateView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electioncategory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.resultSelectStateView,
        arguments: ResultSelectStateViewArguments(
            key: key, electioncategory: electioncategory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResultSelectLocalGovernmentView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electioncategory,
    required String selectedState,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.resultSelectLocalGovernmentView,
        arguments: ResultSelectLocalGovernmentViewArguments(
            key: key,
            electioncategory: electioncategory,
            selectedState: selectedState),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewResultView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electionCategory,
    String? selectedLocalGovernment,
    String? selectedState,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.viewResultView,
        arguments: ViewResultViewArguments(
            key: key,
            electionCategory: electionCategory,
            selectedLocalGovernment: selectedLocalGovernment,
            selectedState: selectedState),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToElectionInfoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.electionInfoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegistrationSuccessfulView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registrationSuccessfulView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i22.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithElectionOptionsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.electionOptionsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCastVoteView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electionCategory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.castVoteView,
        arguments:
            CastVoteViewArguments(key: key, electionCategory: electionCategory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCandidateOptionsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.candidateOptionsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewCandidatesView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electionCategory,
    String? selectedLocalGovernment,
    String? selectedState,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.viewCandidatesView,
        arguments: ViewCandidatesViewArguments(
            key: key,
            electionCategory: electionCategory,
            selectedLocalGovernment: selectedLocalGovernment,
            selectedState: selectedState),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVotingSuccessView({
    _i22.Key? key,
    required String selectedCandidateImgUrl,
    required String selectedCandidateName,
    required String selectedCandidateParty,
    required _i24.VotingappUser user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.votingSuccessView,
        arguments: VotingSuccessViewArguments(
            key: key,
            selectedCandidateImgUrl: selectedCandidateImgUrl,
            selectedCandidateName: selectedCandidateName,
            selectedCandidateParty: selectedCandidateParty,
            user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSelectStateView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electioncategory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.selectStateView,
        arguments: SelectStateViewArguments(
            key: key, electioncategory: electioncategory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSelectLocalGovernmentView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electioncategory,
    required String selectedState,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.selectLocalGovernmentView,
        arguments: SelectLocalGovernmentViewArguments(
            key: key,
            electioncategory: electioncategory,
            selectedState: selectedState),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResultOptionsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resultOptionsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResultSelectStateView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electioncategory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.resultSelectStateView,
        arguments: ResultSelectStateViewArguments(
            key: key, electioncategory: electioncategory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResultSelectLocalGovernmentView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electioncategory,
    required String selectedState,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.resultSelectLocalGovernmentView,
        arguments: ResultSelectLocalGovernmentViewArguments(
            key: key,
            electioncategory: electioncategory,
            selectedState: selectedState),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewResultView({
    _i22.Key? key,
    required _i23.ELECTIONCATEGORY electionCategory,
    String? selectedLocalGovernment,
    String? selectedState,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.viewResultView,
        arguments: ViewResultViewArguments(
            key: key,
            electionCategory: electionCategory,
            selectedLocalGovernment: selectedLocalGovernment,
            selectedState: selectedState),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithElectionInfoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.electionInfoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegistrationSuccessfulView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registrationSuccessfulView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
