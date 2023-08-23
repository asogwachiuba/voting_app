import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/result_select_state/view/result_select_state_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/widgets/option_tile.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class ResultSelectStateView extends StatelessWidget {
  const ResultSelectStateView({
    super.key,
    required this.electioncategory,
  });
  final ELECTIONCATEGORY electioncategory;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultSelectStateViewmodel>.reactive(
      viewModelBuilder: (() => ResultSelectStateViewmodel()),
      onViewModelReady: (viewModel) =>
          viewModel.onReady(electioncategory: electioncategory),
      builder: (context, viewModel, child) => Scaffold(
        body: SizedBox.expand(
          child: ListView(
            children: [
              const OptionsAppBar(
                title: 'Select State',
                subtitle: 'Select your state of interest',
              ),

              // List of states
              ListView.builder(
                itemCount: viewModel.states.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: OptionTile(
                        title: viewModel.states[index],
                        onPressed: () => viewModel.stateIsSelected(
                            selectedState: viewModel.states[index]),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
