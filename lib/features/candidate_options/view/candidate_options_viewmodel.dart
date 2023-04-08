import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/view_candidates/view/view_candidates_view.dart';

class CandidateOptionsViewModel extends VotingAppViewmodel {
  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  toViewCandidates({required String electionCategory}) {
    navigationService
        .navigateToView(ViewCandidatesView(electionCategory: electionCategory));
  }
}
