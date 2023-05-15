import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/constants/keys.dart';
import 'package:voting_app/features/voting/view/cast_vote_viewmodel.dart';
import 'package:voting_app/features/voting/widget/cast_vote_backgroung_painter.dart';
import 'package:voting_app/features/voting/widget/cast_vote_candidate_tile.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/widgets/app_loader.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

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
        body: viewModel.isVoting
            ? SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLoader(),
                    Text(
                      "Your vote is registering",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  OptionsAppBar(
                    title: "${electionCategory.name.toUpperCase()} ELECTION",
                    subtitle: (electionCategory ==
                                ELECTIONCATEGORY.gubernatorial ||
                            electionCategory ==
                                ELECTIONCATEGORY.localGovernment)
                        ? "${viewModel.user?.electionState} State, Nigeria ${(electionCategory == ELECTIONCATEGORY.localGovernment) ? "\n${viewModel.user?.electionLocalGovernment}" : ""}"
                        : "NIGERIA",
                  ),
                  Assets.stepTwo.svg(
                    width: 125,
                    height: 12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Step 4 of 4',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7)),
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
    );
  }
}
