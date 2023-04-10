import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/home/widget/dashboard_button.dart';
import 'package:voting_app/features/result_options/view/result_options_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';

class ResultOptionsView extends StatelessWidget {
  const ResultOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultOptionsViewModel>.reactive(
      viewModelBuilder: (() => ResultOptionsViewModel()),
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
                child: ListView(
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
                        const Spacer(),
                        const Text(
                          "Result Category",
                          style: TextStyle(
                            color: ColorList.lightGreen,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    DashboardButton(
                      icon: Icons.how_to_vote,
                      title: 'PRESIDENTIAL',
                      onPressed: () {
                        viewModel.toViewResult(
                            electionCategory: ELECTIONCATEGORY.presidential);
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DashboardButton(
                      icon: Icons.how_to_vote,
                      title: 'GUBERNATORIAL',
                      onPressed: () {
                        viewModel.toSelectState(
                            electioncategory: ELECTIONCATEGORY.gubernatorial);
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DashboardButton(
                      icon: Icons.how_to_vote,
                      title: 'LOCAL GOVERNMENT CHAIRMAN',
                      onPressed: () {
                        viewModel.toSelectState(
                            electioncategory: ELECTIONCATEGORY.localGovernment);
                      },
                    ),
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
