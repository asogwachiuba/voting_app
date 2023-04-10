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
                          return ViewResultTile(
                              party: viewModel.candidates[index]['party'],
                              votes: viewModel.candidates[index]['votes']
                                  .toString());
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
