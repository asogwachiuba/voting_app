import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/result_select_local_government/view/result_select_local_government_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';

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
                        "Select Local Government",
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
                    itemCount: viewModel.localGovenments.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: ((context, index) => InkWell(
                          onTap: () => viewModel.toViewResult(
                              selectedLocalGovernment:
                                  viewModel.localGovenments[index]),
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(viewModel.localGovenments[index]),
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
