import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/select_state/view/select_state_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';

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
        body: SizedBox.expand(
          child: Stack(children: [
            CustomPaint(
              size: const Size(double.infinity, double.infinity),
              painter: DashboardBackgroundPainter(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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
                      const Spacer(),
                      const Text(
                        "Select State",
                        style: TextStyle(
                          color: ColorList.lightGreen,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),

                  // List of states
                  ListView.builder(
                    itemCount: viewModel.states.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: ((context, index) => InkWell(
                          onTap: () => viewModel.stateIsSelected(
                              selectedState: viewModel.states[index]),
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(viewModel.states[index]),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
