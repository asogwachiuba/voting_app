import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/features/candidate_options/view/candidate_options_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/widgets/option_tile.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class CandidateOptionsView extends StatelessWidget {
  const CandidateOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CandidateOptionsViewModel>.reactive(
      viewModelBuilder: (() => CandidateOptionsViewModel()),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
              child: Column(
            children: [
              const OptionsAppBar(
                title: 'Candidates Category',
                subtitle: "Select your election category of interest",
              ),
              OptionTile(
                title: 'PRESIDENTIAL',
                onPressed: () {
                  viewModel.toViewCandidates(
                      electionCategory: ELECTIONCATEGORY.presidential);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              OptionTile(
                title: 'GUBERNATORIAL',
                onPressed: () {
                  viewModel.toSelectState(
                      electioncategory: ELECTIONCATEGORY.gubernatorial);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              OptionTile(
                title: 'LOCAL GOVERNMENT CHAIRMAN',
                onPressed: () {
                  viewModel.toSelectState(
                      electioncategory: ELECTIONCATEGORY.localGovernment);
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
