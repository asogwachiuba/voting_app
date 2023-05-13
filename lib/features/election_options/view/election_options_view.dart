import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/features/election_options/view/election_options_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/widgets/option_tile.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class ElectionOptionsView extends StatelessWidget {
  const ElectionOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ElectionOptionsViewModel>.reactive(
      viewModelBuilder: (() => ElectionOptionsViewModel()),
      builder: (context, viewModel, child) => Scaffold(
        body: SizedBox.expand(
          child: Column(
            children: [
              const OptionsAppBar(
                title: 'Election Accreditation',
                subtitle: "Select your election category you want to vote for",
              ),
              OptionTile(
                title: 'PRESIDENTIAL',
                onPressed: () {
                  viewModel.toCastVote(
                      electionCategory: ELECTIONCATEGORY.presidential);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              OptionTile(
                title: 'GUBERNATORIAL',
                onPressed: () {
                  viewModel.toCastVote(
                      electionCategory: ELECTIONCATEGORY.gubernatorial);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              OptionTile(
                title: 'LOCAL GOVERNMENT CHAIRMAN',
                onPressed: () {
                  viewModel.toCastVote(
                      electionCategory: ELECTIONCATEGORY.localGovernment);
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
          /*Stack(
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
                          "Election Accreditation",
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
                        viewModel.toCastVote(
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
                        viewModel.toCastVote(
                            electionCategory: ELECTIONCATEGORY.gubernatorial);
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DashboardButton(
                      icon: Icons.how_to_vote,
                      title: 'LOCAL GOVERNMENT CHAIRMAN',
                      onPressed: () {
                        viewModel.toCastVote(
                            electionCategory: ELECTIONCATEGORY.localGovernment);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),*/
        ),
      ),
    );
  }
}
