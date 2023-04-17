import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/voting_success/view/voting_success_view.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/models/user/votingapp_user.dart';
import 'package:voting_app/util/notification.dart';

class CastVoteViewModel extends VotingAppViewmodel {
  /// States and variables =====================================================

  VotingappUser? _user;
  VotingappUser? get user => _user;
  set user(VotingappUser? newValue) {
    _user = newValue;
    notifyListeners();
  }

  ELECTIONCATEGORY? _electioncategory;
  ELECTIONCATEGORY? get electioncategory => _electioncategory;
  set electioncategory(ELECTIONCATEGORY? newValue) {
    _electioncategory = newValue;
    notifyListeners();
  }

  List _candidates = [];
  List get candidates => _candidates;
  set candidates(List newValue) {
    _candidates = newValue;
    notifyListeners();
  }

  bool _isVoting = false;
  bool get isVoting => _isVoting;
  set isVoting(bool newValue) {
    _isVoting = newValue;
    notifyListeners();
  }

  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  onReady({required ELECTIONCATEGORY electioncategory_}) async {
    busy(true);
    electioncategory = electioncategory_;
    user = db.getCurrentUser();
    await getCandidates();
    busy(false);
  }

  toVotingSuccess(
      String candidateName, String cadidateImgUrl, String candidateParty) {
    navigationService.navigateToView(VotingSuccessView(
      selectedCandidateImgUrl: cadidateImgUrl,
      selectedCandidateName: candidateName,
      selectedCandidateParty: candidateParty,
      user: user!,
    ));
  }

  getCandidates() async {
    switch (electioncategory) {
      case ELECTIONCATEGORY.presidential:
        await db.getPresidentialCandidates().then((data) {
          candidates = data.values.toList();
        }, onError: (e) => logger.d("Error getting candidates $e"));
        break;
      case ELECTIONCATEGORY.gubernatorial:
        await db
            .getGubernatorialCandidates(state: user?.electionState ?? "")
            .then((data) {
          candidates = data.values.toList();
        }, onError: (e) => logger.d("Error getting candidates $e"));
        break;
      case ELECTIONCATEGORY.localGovernment:
        await db
            .getLocalGovernmentCandidates(
                state: user?.electionState ?? "",
                localGovernment: user?.electionLocalGovernment ?? "")
            .then((data) {
          candidates = data.values.toList();
        }, onError: (e) => logger.d("Error getting candidates $e"));
        break;
    }
    return candidates;
  }

  vote(
    String candidateName,
    String cadidateImgUrl,
    String selectedPartyAcronym,
  ) async {
    isVoting = true;
    bool isSuccessful = await db.vote(
      electioncategory: electioncategory!,
      partyAcronym: selectedPartyAcronym,
      state: user?.electionState,
      localGovernment: user?.electionLocalGovernment,
    );
    isVoting = false;

    if (!isSuccessful) {
      AppNotification.error(error: "Vote unsuccessfyl. Try again");
      return;
    }
    toVotingSuccess(candidateName, cadidateImgUrl, selectedPartyAcronym);
  }
}
