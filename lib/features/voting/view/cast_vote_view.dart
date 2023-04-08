import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/voting/view/cast_vote_viewmodel.dart';
import 'package:voting_app/features/voting/widget/cast_vote_backgroung_painter.dart';
import 'package:voting_app/features/voting/widget/cast_vote_candidate_tile.dart';

class CastVoteView extends StatelessWidget {
  const CastVoteView({
    super.key,
    required this.electionCategory,
  });
  final String electionCategory;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CastVoteViewModel>.reactive(
      viewModelBuilder: (() => CastVoteViewModel()),
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
                          electionCategory,
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
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return CastVoteCandidateTile(
                        candidateName: "Asogwa Chi-uba",
                        candidateParty: "Labour Party",
                        candidateImgUrl:
                            "https://source.unsplash.com/200x200/?portrait,John Doe",
                        onVote: viewModel.toVotingSuccess,
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
