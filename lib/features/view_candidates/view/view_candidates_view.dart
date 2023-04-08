import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/home/widget/dashboard_button.dart';
import 'package:voting_app/features/view_candidates/view/view_candidates_viewmodel.dart';
import 'package:voting_app/features/view_candidates/widget/view_candidates_tile.dart';
import 'package:voting_app/features/voting/widget/cast_vote_candidate_tile.dart';

class ViewCandidatesView extends StatelessWidget {
  const ViewCandidatesView({
    super.key,
    required this.electionCategory,
  });
  final String electionCategory;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewCandidatesViewModel>.reactive(
      viewModelBuilder: (() => ViewCandidatesViewModel()),
      builder: (context, viewModel, child) => Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              CustomPaint(
                size: const Size(double.infinity, double.infinity),
                painter: DashboardBackgroundPainter(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  children: [
                    Row(
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
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            electionCategory,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: ColorList.lightGreen,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ViewCandidateTile(
                            candidateName: "Asogwa Chi-uba Uchenna",
                            candidateParty: "Labour Party",
                            candidateImgUrl:
                                "https://source.unsplash.com/200x200/?portrait,John Doe",
                            candidateDescription:
                                "This guy is a cool guy. He knows His way aroung and believes in people. He fights for what he wants and values family and friendships. Kisses, better dodge it.",
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
