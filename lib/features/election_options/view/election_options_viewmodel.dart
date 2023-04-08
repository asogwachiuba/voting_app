import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/voting/view/cast_vote_view.dart';

class ElectionOptionsViewModel extends VotingAppViewmodel {
  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  toCastVote({required String electionCategory}) {
    navigationService
        .navigateToView(CastVoteView(electionCategory: electionCategory));
  }
}
