import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/features/election_options/view/election_options_viewmodel.dart';
import 'package:voting_app/features/home/widget/dashbboard_tabs.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/widgets/option_tile.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class ElectionOptionsView extends StatelessWidget {
  const ElectionOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    String subTitle =
        'Find and vote your preferred electoral candidates by just'
        'selecting the candidate and casting your votes.';
    return ViewModelBuilder<ElectionOptionsViewModel>.reactive(
      viewModelBuilder: (() => ElectionOptionsViewModel()),
      builder: (context, viewModel, child) => Scaffold(
        body: SizedBox.expand(
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const OptionsAppBar(
                  title: 'Voting Poll',
                  subtitle:
                      "Please complete a few tasks to make your vote count",
                ),
                Assets.stepThree.svg(
                  width: 125,
                  height: 12,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Step 3 of 4',
                  style: TextStyle(
                      fontSize: CustomFont.smallestFontSize,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(
                  height: 50,
                ),
                DashboardTabs(
                  icons: Assets.icElectionType.svg(
                    width: 46,
                    height: 44,
                    fit: BoxFit.fill,
                  ),
                  onPresed: () {
                    viewModel.toCastVote(
                        electionCategory: ELECTIONCATEGORY.presidential);
                  },
                  title: 'Presidential Election',
                  subtitle: subTitle,
                ),
                const SizedBox(
                  height: 15,
                ),
                DashboardTabs(
                  icons: Assets.icElectionType.svg(
                    width: 46,
                    height: 44,
                    fit: BoxFit.fill,
                  ),
                  onPresed: () {
                    viewModel.toCastVote(
                        electionCategory: ELECTIONCATEGORY.gubernatorial);
                  },
                  title: 'Gubernatorial Election',
                  subtitle: subTitle,
                ),
                const SizedBox(
                  height: 15,
                ),
                DashboardTabs(
                  icons: Assets.icElectionType.svg(
                    width: 46,
                    height: 44,
                    fit: BoxFit.fill,
                  ),
                  onPresed: () {
                    viewModel.toCastVote(
                        electionCategory: ELECTIONCATEGORY.localGovernment);
                  },
                  title: 'Local Government Election',
                  subtitle: subTitle,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
