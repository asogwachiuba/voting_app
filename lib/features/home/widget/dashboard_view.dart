import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/features/home/widget/dashbboard_tabs.dart';
import 'package:voting_app/features/home/widget/dashboard_button.dart';
import 'package:voting_app/features/home/widget/dashboard_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:voting_app/gen/assets.gen.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _showLogoutDialog({required VoidCallback logout}) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Do you want to Logout',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'Click YES to logout, if you want to logout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                onPressed: (() {
                  // removes the current pop up
                  Navigator.of(context).pop();
                  // then log out the user
                  logout();
                }),
                child: const Text('Yes'),
              ),
            ],
          );
        },
      );
    }

    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: (() => DashboardViewModel()),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: ((context, viewModel, child) => Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Persnal Info
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          viewModel.user?.profileImageUrl ?? "",
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.fill,
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hello ${viewModel.user?.fullName ?? ""}",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Text(
                                        'Welcome to the Voting App',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: CustomFont.smallestFontSize,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => _showLogoutDialog(
                                        logout: viewModel.logOut),
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
                            ),
                          ],
                        ),
                      ),
                      // Tabs
                      DashboardTabs(
                        icons: Assets.icVotingPoll.svg(),
                        title: "Voting Poll",
                        subtitle:
                            "Find and vote your preferred candidates by just selecting the type of election and casting your votes.",
                        onPresed: viewModel.toAccreditation,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DashboardTabs(
                        icons: Assets.icCandidates.svg(),
                        title: "Election Candidates",
                        subtitle:
                            "Find your preferred candidates and other candidates by selecting the type of election category and states, local government where applicable.",
                        onPresed: viewModel.toCandidateOptions,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DashboardTabs(
                        icons: Assets.icResults.svg(),
                        title: "Election Results",
                        subtitle:
                            "Check live updates of election votes count for various categories, states and local government.",
                        onPresed: viewModel.toResultOption,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DashboardTabs(
                        icons: Assets.icInfo.svg(),
                        title: "Election Info",
                        subtitle:
                            "For more information on the election process and FAQ.",
                        onPresed: viewModel.toElectionInfo,
                      ),
                      const SizedBox(
                        height: 15,
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
