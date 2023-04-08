import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/voting_success/view/voting_success_view.dart';

class CastVoteViewModel extends VotingAppViewmodel {
  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  toVotingSuccess(
      String candidateName, String cadidateImgUrl, String candidateParty) {
    navigationService.navigateToView(VotingSuccessView(
        selectedCandidateImgUrl: cadidateImgUrl,
        selectedCandidateName: candidateName,
        selectedCandidateParty: candidateParty));
  }
}
