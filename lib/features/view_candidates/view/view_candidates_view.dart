import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/constants/keys.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/view_candidates/view/view_candidates_viewmodel.dart';
import 'package:voting_app/features/view_candidates/widget/view_candidates_tile.dart';
import 'package:voting_app/models/enums/election_category.dart';

class ViewCandidatesView extends StatelessWidget {
  const ViewCandidatesView({
    super.key,
    required this.electionCategory,
    this.selectedLocalGovernment,
    this.selectedState,
  });
  final ELECTIONCATEGORY electionCategory;
  final String? selectedState;
  final String? selectedLocalGovernment;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewCandidatesViewModel>.reactive(
      viewModelBuilder: (() => ViewCandidatesViewModel()),
      onViewModelReady: (viewModel) => viewModel.onReady(
        electioncategory_: electionCategory,
        selectedLocalGovernment_: selectedLocalGovernment,
        selectedState_: selectedState,
      ),
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
                            "${electionCategory.name.toString().toUpperCase()} CANDIDATES",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: ColorList.lightGreen,
                              fontSize: 22,
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
                        itemCount: viewModel.candidates.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ViewCandidateTile(
                            candidateName: viewModel.candidates[index]
                                [Keys.candidate],
                            candidateParty: viewModel.candidates[index]
                                [Keys.party],
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
