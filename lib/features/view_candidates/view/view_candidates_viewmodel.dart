import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/voting/view/cast_vote_view.dart';

class ViewCandidatesViewModel extends VotingAppViewmodel {
  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  toViewCandidates({required String electionCategory}) {
    navigationService
        .navigateToView(CastVoteView(electionCategory: electionCategory));
  }
}
