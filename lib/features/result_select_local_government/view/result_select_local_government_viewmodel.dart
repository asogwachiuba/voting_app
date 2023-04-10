import 'package:voting_app/constants/election_data.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/view_candidates/view/view_candidates_view.dart';
import 'package:voting_app/features/view_result/view/view_result_view.dart';
import 'package:voting_app/models/enums/election_category.dart';

class ResultSelectLocalGovernmentViewmodel extends VotingAppViewmodel {
  /// States and variables =====================================================

  late ELECTIONCATEGORY _selectedElectionCategory;
  ELECTIONCATEGORY get selectedElectionCategory => _selectedElectionCategory;
  set selectedElectionCategory(ELECTIONCATEGORY newValue) {
    _selectedElectionCategory = newValue;
    notifyListeners();
  }

  late String _selectdState;
  String get selectdState => _selectdState;
  set selectdState(String newValue) {
    _selectdState = newValue;
    notifyListeners();
  }

  List<String> _localGovenments = [];
  List<String> get localGovenments => _localGovenments;
  set localGovenments(List<String> newValue) {
    _localGovenments = newValue;
    notifyListeners();
  }

  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  getLocalGovernments() {
    int stateIndex = ElectionData.states.indexOf(selectdState);
    logger.d("the state index is ${stateIndex}");
    ElectionData.pollingUnits[stateIndex][selectdState].forEach((data) {
      localGovenments.add(data['local_government']);
      logger.d("the local government is ${stateIndex}");
    });
  }

  onReady({
    required ELECTIONCATEGORY electioncategory,
    required String selectedState_,
  }) {
    selectedElectionCategory = electioncategory;
    selectdState = selectedState_;
    getLocalGovernments();
  }

  toViewResult({
    required String selectedLocalGovernment,
  }) {
    navigationService.navigateToView(ViewResultView(
      electionCategory: selectedElectionCategory,
      selectedState: selectdState,
      selectedLocalGovernment: selectedLocalGovernment,
    ));
  }
}
