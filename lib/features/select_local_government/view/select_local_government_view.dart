import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/select_local_government/view/select_local_government_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/widgets/option_tile.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class SelectLocalGovernmentView extends StatelessWidget {
  const SelectLocalGovernmentView({
    super.key,
    required this.electioncategory,
    required this.selectedState,
  });
  final ELECTIONCATEGORY electioncategory;
  final String selectedState;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectLocalGovernmentViewmodel>.reactive(
      viewModelBuilder: (() => SelectLocalGovernmentViewmodel()),
      onViewModelReady: (viewModel) => viewModel.onReady(
        electioncategory: electioncategory,
        selectedState_: selectedState,
      ),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              children: [
                const OptionsAppBar(
                  title: 'Select Local Government',
                  subtitle: "Select your local government of interest",
                ),

                // List of states
                ListView.builder(
                  itemCount: viewModel.localGovenments.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: OptionTile(
                          title: viewModel.localGovenments[index],
                          onPressed: () => viewModel.toViewCandidates(
                              selectedLocalGovernment:
                                  viewModel.localGovenments[index]),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
