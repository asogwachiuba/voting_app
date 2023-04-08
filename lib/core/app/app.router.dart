// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i13;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;
import 'package:voting_app/features/candidate_options/view/candidate_options_view.dart'
    as _i10;
import 'package:voting_app/features/election_options/view/election_options_view.dart'
    as _i8;
import 'package:voting_app/features/forgot_password/view/forgot_password_view.dart'
    as _i7;
import 'package:voting_app/features/home/view/home_view.dart' as _i6;
import 'package:voting_app/features/login/view/login_view.dart' as _i3;
import 'package:voting_app/features/onboarding/view/onboarding_view.dart'
    as _i2;
import 'package:voting_app/features/register/view/register_view.dart' as _i5;
import 'package:voting_app/features/reset_password/view/reset_password_view.dart'
    as _i4;
import 'package:voting_app/features/view_candidates/view/view_candidates_view.dart'
    as _i11;
import 'package:voting_app/features/voting/view/cast_vote_view.dart' as _i9;
import 'package:voting_app/features/voting_success/view/voting_success_view.dart'
    as _i12;

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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.OnboardingView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.OnboardingView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.LoginView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.ResetPasswordView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ResetPasswordView(),
        settings: data,
        maintainState: false,
      );
    },
    _i5.RegisterView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.RegisterView(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.HomeView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.HomeView(),
        settings: data,
        maintainState: false,
      );
    },
    _i7.ForgotPasswordView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ForgotPasswordView(),
        settings: data,
        maintainState: false,
      );
    },
    _i8.ElectionOptionsView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ElectionOptionsView(),
        settings: data,
        maintainState: false,
      );
    },
    _i9.CastVoteView: (data) {
      final args = data.getArgs<CastVoteViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.CastVoteView(
            key: args.key, electionCategory: args.electionCategory),
        settings: data,
        maintainState: false,
      );
    },
    _i10.CandidateOptionsView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.CandidateOptionsView(),
        settings: data,
        maintainState: false,
      );
    },
    _i11.ViewCandidatesView: (data) {
      final args = data.getArgs<ViewCandidatesViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.ViewCandidatesView(
            key: args.key, electionCategory: args.electionCategory),
        settings: data,
        maintainState: false,
      );
    },
    _i12.VotingSuccessView: (data) {
      final args = data.getArgs<VotingSuccessViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.VotingSuccessView(
            key: args.key,
            selectedCandidateImgUrl: args.selectedCandidateImgUrl,
            selectedCandidateName: args.selectedCandidateName,
            selectedCandidateParty: args.selectedCandidateParty),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CastVoteViewArguments {
  const CastVoteViewArguments({
    this.key,
    required this.electionCategory,
  });

  final _i13.Key? key;

  final String electionCategory;

  @override
  String toString() {
    return '{"key": "$key", "electionCategory": "$electionCategory"}';
  }
}

class ViewCandidatesViewArguments {
  const ViewCandidatesViewArguments({
    this.key,
    required this.electionCategory,
  });

  final _i13.Key? key;

  final String electionCategory;

  @override
  String toString() {
    return '{"key": "$key", "electionCategory": "$electionCategory"}';
  }
}

class VotingSuccessViewArguments {
  const VotingSuccessViewArguments({
    this.key,
    required this.selectedCandidateImgUrl,
    required this.selectedCandidateName,
    required this.selectedCandidateParty,
  });

  final _i13.Key? key;

  final String selectedCandidateImgUrl;

  final String selectedCandidateName;

  final String selectedCandidateParty;

  @override
  String toString() {
    return '{"key": "$key", "selectedCandidateImgUrl": "$selectedCandidateImgUrl", "selectedCandidateName": "$selectedCandidateName", "selectedCandidateParty": "$selectedCandidateParty"}';
  }
}

extension NavigatorStateExtension on _i14.NavigationService {
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

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
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
    _i13.Key? key,
    required String electionCategory,
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
    _i13.Key? key,
    required String electionCategory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.viewCandidatesView,
        arguments: ViewCandidatesViewArguments(
            key: key, electionCategory: electionCategory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVotingSuccessView({
    _i13.Key? key,
    required String selectedCandidateImgUrl,
    required String selectedCandidateName,
    required String selectedCandidateParty,
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
            selectedCandidateParty: selectedCandidateParty),
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

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
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
    _i13.Key? key,
    required String electionCategory,
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
    _i13.Key? key,
    required String electionCategory,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.viewCandidatesView,
        arguments: ViewCandidatesViewArguments(
            key: key, electionCategory: electionCategory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVotingSuccessView({
    _i13.Key? key,
    required String selectedCandidateImgUrl,
    required String selectedCandidateName,
    required String selectedCandidateParty,
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
            selectedCandidateParty: selectedCandidateParty),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
