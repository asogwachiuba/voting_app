import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/select_state/view/select_state_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/widgets/option_tile.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class SelectStateView extends StatelessWidget {
  const SelectStateView({
    super.key,
    required this.electioncategory,
  });
  final ELECTIONCATEGORY electioncategory;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectStateViewmodel>.reactive(
      viewModelBuilder: (() => SelectStateViewmodel()),
      onViewModelReady: (viewModel) =>
          viewModel.onReady(electioncategory: electioncategory),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
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
        ),
      ),
    );
  }
}
