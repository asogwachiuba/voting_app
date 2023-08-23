import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/constants/keys.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/view_candidates/view/view_candidates_viewmodel.dart';
import 'package:voting_app/features/view_candidates/widget/view_candidates_tile.dart';
import 'package:voting_app/gen/assets.gen.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: Column(
                  children: [
                    // Back button and title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Assets.icBack.svg(
                                  height: 15, width: 17, fit: BoxFit.fill)),
                          const Spacer(),
                          Text(
                            "${electionCategory.name.toString().toUpperCase()} \nCANDIDATES",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
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
                            partyAcronym: viewModel.candidates[index]
                                ["acronym"],
                            electioncategory: viewModel.electioncategory,
                            candidateImgUrl:
                                "https://source.unsplash.com/200x200/?portrait,John Doe",
                            candidateDescription:
                                "${viewModel.candidates[index][Keys.candidate]} is a ${viewModel.candidates[index][Keys.party]} member who is running for ${viewModel.electioncategory.name} election in Nigeria. They grew up in Nigeria and attended high school and prestigous university. After graduation, he engaged himself in political activities in which he executed well for his party and for the greater good of Nigeria."
                                "\n  ${viewModel.candidates[index][Keys.candidate]} has always been passionate about political issue or community service, and has volunteered with several organizations focused on growth of Nigeria Economy and Nigerian citizens.",
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
