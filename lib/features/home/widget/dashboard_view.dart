import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/features/home/widget/dashboard_button.dart';
import 'package:voting_app/features/home/widget/dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: (() => DashboardViewModel()),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: ((context, viewModel, child) => Stack(
            children: [
              CustomPaint(
                size: const Size(double.infinity, double.infinity),
                painter: DashboardBackgroundPainter(),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Hello ${viewModel.user?.fullName ?? ""}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: ColorList.lightGreen,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Card(
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.power_settings_new,
                                color: ColorList.darkGreen,
                              ),
                              onPressed: () => viewModel.logOut(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32.0),
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Voting App',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 32.0,
                          crossAxisSpacing: 16.0,
                          children: [
                            DashboardButton(
                              icon: Icons.how_to_vote,
                              title: 'Vote',
                              onPressed: () {
                                viewModel.toAccreditation();
                              },
                            ),
                            DashboardButton(
                              icon: Icons.people,
                              title: 'Election Candidates',
                              onPressed: () {
                                viewModel.toCandidateOptions();
                              },
                            ),
                            DashboardButton(
                              icon: Icons.assignment_turned_in,
                              title: 'Election Result',
                              onPressed: () {
                                viewModel.toResultOption();
                              },
                            ),
                            DashboardButton(
                              icon: Icons.info,
                              title: 'Election Info',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
