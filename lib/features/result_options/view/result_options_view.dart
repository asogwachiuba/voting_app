import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/home/widget/dashboard_button.dart';
import 'package:voting_app/features/result_options/view/result_options_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/widgets/option_tile.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class ResultOptionsView extends StatelessWidget {
  const ResultOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultOptionsViewModel>.reactive(
      viewModelBuilder: (() => ResultOptionsViewModel()),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: ListView(
              children: [
                const OptionsAppBar(
                  title: 'Result Category',
                  subtitle: "Select your election category of interest",
                ),
                OptionTile(
                  title: 'PRESIDENTIAL',
                  onPressed: () {
                    viewModel.toViewResult(
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
            ),
          ),
        ),
      ),
    );
  }
}
