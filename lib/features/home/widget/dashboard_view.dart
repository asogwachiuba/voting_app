import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/dashboard_button.dart';
import 'package:voting_app/features/home/widget/dashboard_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: (() => DashboardViewModel()),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: ((context, viewModel, child) => Stack(
            children: [
              // CustomPaint(
              //   size: const Size(double.infinity, double.infinity),
              //   painter: DashboardBackgroundPainter(),
              // ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: viewModel.user?.profileImageUrl ?? "",
                              height: 40,
                              width: 40,
                              fit: BoxFit.fill,
                              errorWidget: (context, url, error) => const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "Hi ${viewModel.user?.fullName ?? ""}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => viewModel.logOut(),
                            child: const Card(
                              color: Color.fromARGB(255, 212, 238, 221),
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.power_settings_new,
                                  color: ColorList.darkGreen,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32.0),
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ColorList.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        '     Voting App',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: ColorList.primaryColor,
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
                              onPressed: () {
                                viewModel.toElectionInfo();
                              },
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
