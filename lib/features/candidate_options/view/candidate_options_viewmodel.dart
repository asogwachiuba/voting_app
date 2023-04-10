import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/select_state/view/select_state_view.dart';
import 'package:voting_app/features/view_candidates/view/view_candidates_view.dart';
import 'package:voting_app/models/enums/election_category.dart';

class CandidateOptionsViewModel extends VotingAppViewmodel {
  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  toViewCandidates({required ELECTIONCATEGORY electionCategory}) {
    navigationService
        .navigateToView(ViewCandidatesView(electionCategory: electionCategory));
  }

  toSelectState({required ELECTIONCATEGORY electioncategory}) {
    navigationService
        .navigateToView(SelectStateView(electioncategory: electioncategory));
  }
}
