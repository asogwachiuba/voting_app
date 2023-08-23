import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/features/result_select_local_government/view/result_select_local_government_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/widgets/option_tile.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class ResultSelectLocalGovernmentView extends StatelessWidget {
  const ResultSelectLocalGovernmentView({
    super.key,
    required this.electioncategory,
    required this.selectedState,
  });
  final ELECTIONCATEGORY electioncategory;
  final String selectedState;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultSelectLocalGovernmentViewmodel>.reactive(
      viewModelBuilder: (() => ResultSelectLocalGovernmentViewmodel()),
      onViewModelReady: (viewModel) => viewModel.onReady(
        electioncategory: electioncategory,
        selectedState_: selectedState,
      ),
      builder: (context, viewModel, child) => Scaffold(
        body: SizedBox.expand(
          child: ListView(
            children: [
              const OptionsAppBar(
                title: 'Select Local Government',
                subtitle: 'Select your state of interest',
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
                        onPressed: () => viewModel.toViewResult(
                            selectedLocalGovernment:
                                viewModel.localGovenments[index]),
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
