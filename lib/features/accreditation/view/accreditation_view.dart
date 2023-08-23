import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/features/accreditation/view/accreditation_viewmodel.dart';
import 'package:voting_app/features/accreditation/widget/vote_step_1.dart';
import 'package:voting_app/features/accreditation/widget/vote_step_2.dart';

class AccreditationView extends StatelessWidget {
  const AccreditationView({super.key});

  final List<Widget> accreditationSteps = const [
    VoteStep1(),
    VoteStep2(),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccreditationViewModel>.reactive(
      viewModelBuilder: (() => AccreditationViewModel()),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      onDispose: (viewModel) => viewModel.dispose(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: accreditationSteps[viewModel.currentStep],
          ),
        ),
      ),
    );
  }
}
