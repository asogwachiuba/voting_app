import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/constants/keys.dart';
import 'package:voting_app/features/voting/view/cast_vote_viewmodel.dart';
import 'package:voting_app/features/voting/widget/cast_vote_backgroung_painter.dart';
import 'package:voting_app/features/voting/widget/cast_vote_candidate_tile.dart';
import 'package:voting_app/models/enums/election_category.dart';

class CastVoteView extends StatelessWidget {
  const CastVoteView({
    super.key,
    required this.electionCategory,
  });
  final ELECTIONCATEGORY electionCategory;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CastVoteViewModel>.reactive(
      viewModelBuilder: (() => CastVoteViewModel()),
      onViewModelReady: (viewModel) =>
          viewModel.onReady(electioncategory_: electionCategory),
      builder: (context, viewModel, child) => Scaffold(
        body: CustomPaint(
          painter: CastVoteBackgroundPainter(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: Card(
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: ColorList.darkGreen,
                            ),
                            onPressed: () => viewModel.back(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          "${electionCategory.name.toUpperCase()} ELECTION",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (electionCategory == ELECTIONCATEGORY.gubernatorial ||
                    electionCategory == ELECTIONCATEGORY.localGovernment)
                  Center(
                    child: Text(
                      "${viewModel.user?.electionState} State",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                if (electionCategory == ELECTIONCATEGORY.localGovernment)
                  Center(
                    child: Text(
                      " ${viewModel.user?.electionLocalGovernment}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                viewModel.isBusy
                    ? const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 10,
                            color: ColorList.lightGreen,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: viewModel.candidates.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CastVoteCandidateTile(
                              candidateName: viewModel.candidates[index]
                                  [Keys.candidate],
                              candidateParty: viewModel.candidates[index]
                                  [Keys.party],
                              candidateImgUrl:
                                  "https://source.unsplash.com/200x200/?portrait,John Doe",
                              partyAcronym: viewModel.candidates[index]
                                  ["acronym"],
                              onVote: viewModel.vote,
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
