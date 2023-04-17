import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/util/notification.dart';

class ViewResultViewmodel extends VotingAppViewmodel {
  /// States and variables =====================================================
  late ELECTIONCATEGORY _electioncategory;
  ELECTIONCATEGORY get electioncategory => _electioncategory;
  set electioncategory(ELECTIONCATEGORY newValue) {
    _electioncategory = newValue;
    notifyListeners();
  }

  String? _selectdState;
  String? get selectdState => _selectdState;
  set selectdState(String? newValue) {
    _selectdState = newValue;
    notifyListeners();
  }

  String? _selectdLocalGovernment;
  String? get selectdLocalGovernment => _selectdLocalGovernment;
  set selectdLocalGovernment(String? newValue) {
    _selectdLocalGovernment = newValue;
    notifyListeners();
  }

  List<Map<String, dynamic>> _candidates = [];
  List<Map<String, dynamic>> get candidates => _candidates;
  set candidates(List<Map<String, dynamic>> newValue) {
    _candidates = newValue;
    notifyListeners();
  }

  int _totalElectionVote = 0;
  int get totalElectionVote => _totalElectionVote;
  set totalElectionVote(int newValue) {
    _totalElectionVote = newValue;
    notifyListeners();
  }

  int _highestVote = 0;
  int get highestVote => _highestVote;
  set highestVote(int newValue) {
    _highestVote = newValue;
    notifyListeners();
  }

  /// Methods ==================================================================

  onReady({
    required ELECTIONCATEGORY electioncategory_,
    String? selectedState_,
    String? selectedLocalGovernment_,
  }) async {
    electioncategory = electioncategory_;
    selectdLocalGovernment = selectedLocalGovernment_;
    selectdState = selectedState_;
    await getCandidates();
  }

  back() {
    navigationService.back();
  }

  getHighestNumberOfVote({required List<int> data}) {
    for (var element in data) {
      // calculates the total election votes
      totalElectionVote += element;
      if (element > highestVote) {
        highestVote = element;
      }
    }
    logger.d("The totla vote is $totalElectionVote");
  }

  // toViewCandidates({required ELECTIONCATEGORY electionCategory}) {
  //   navigationService
  //       .navigateToView(CastVoteView(electionCategory: electionCategory));
  // }

  getCandidates() async {
    logger.d(" The election type is ${electioncategory.name}");
    final result = await db.getElectionResult(
      electioncategory: electioncategory,
      state: selectdState,
      localGovernment: selectdLocalGovernment,
    );
    final List<int> votes = [];
    result?.forEach((key, value) {
      candidates.add({
        "party": key,
        "votes": value.toString(),
      });
      votes.add(int.parse(value.toString()));
    });
    getHighestNumberOfVote(data: votes);
    notifyListeners();
  }
}
