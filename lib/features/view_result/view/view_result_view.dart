import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/view_result/widget/view_result_tile.dart';
import 'package:voting_app/models/enums/election_category.dart';

import 'view_result_viewmodel.dart';

class ViewResultView extends StatelessWidget {
  const ViewResultView({
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
    return ViewModelBuilder<ViewResultViewmodel>.reactive(
      viewModelBuilder: (() => ViewResultViewmodel()),
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
                          width: 50,
                        ),
                        Text(
                          "${electionCategory.name.toString().toUpperCase()}\n Result",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: ColorList.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
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
                          return ViewResultTile(
                            party: viewModel.candidates[index]['party'],
                            hasHighestVote: viewModel.highestVote ==
                                int.parse(viewModel.candidates[index]['votes']),
                            votes:
                                viewModel.candidates[index]['votes'].toString(),
                            totalElectionVote: viewModel.totalElectionVote,
                            electioncategory: viewModel.electioncategory,
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
