import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/voting/view/cast_vote_view.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/util/notification.dart';

class ElectionOptionsViewModel extends VotingAppViewmodel {
  /// Methods ==================================================================
  back() {
    navigationService.back();
  }

  toCastVote({required ELECTIONCATEGORY electionCategory}) async {
    final bool hasVoted = await db.checkIfUserHasVoted(
        electioncategory:
            electionCategory); // Checks if user has voted for the selected category
    if (hasVoted) {
      AppNotification.notify(
          notificationMessage:
              "You have voted for your ${electionCategory.name.toLowerCase()} candidate");
      return;
    }
    navigationService
        .navigateToView(CastVoteView(electionCategory: electionCategory));
  }
}
