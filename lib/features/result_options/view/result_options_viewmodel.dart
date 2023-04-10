import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/result_select_state/view/result_select_state_view.dart';
import 'package:voting_app/features/view_result/view/view_result_view.dart';
import 'package:voting_app/models/enums/election_category.dart';

class ResultOptionsViewModel extends VotingAppViewmodel {
  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  toViewResult({required ELECTIONCATEGORY electionCategory}) {
    navigationService
        .navigateToView(ViewResultView(electionCategory: electionCategory));
  }

  toSelectState({required ELECTIONCATEGORY electioncategory}) {
    navigationService.navigateToView(
        ResultSelectStateView(electioncategory: electioncategory));
  }
}
