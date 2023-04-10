import 'package:voting_app/constants/election_data.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/select_local_government/view/select_local_government_view.dart';
import 'package:voting_app/features/view_candidates/view/view_candidates_view.dart';
import 'package:voting_app/models/enums/election_category.dart';

class SelectStateViewmodel extends VotingAppViewmodel {
  /// States and variables =====================================================

  late ELECTIONCATEGORY _selectedElectionCategory;
  ELECTIONCATEGORY get selectedElectionCategory => _selectedElectionCategory;
  set selectedElectionCategory(ELECTIONCATEGORY newValue) {
    _selectedElectionCategory = newValue;
    notifyListeners();
  }

  List<String> states = ElectionData.states;

  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  onReady({required ELECTIONCATEGORY electioncategory}) {
    selectedElectionCategory = electioncategory;
  }

  stateIsSelected({required String selectedState}) {
    if (selectedElectionCategory == ELECTIONCATEGORY.gubernatorial) {
      toViewCandidates(selectedState: selectedState);
    } else {
      toSelectLocalGovernment(selectedState: selectedState);
    }
  }

  toViewCandidates({
    required String selectedState,
  }) {
    navigationService.navigateToView(ViewCandidatesView(
      electionCategory: selectedElectionCategory,
      selectedState: selectedState,
    ));
  }

  toSelectLocalGovernment({
    required String selectedState,
  }) {
    logger.d("Time to select local government");
    navigationService.navigateToView(SelectLocalGovernmentView(
      electioncategory: selectedElectionCategory,
      selectedState: selectedState,
    ));
  }
}
