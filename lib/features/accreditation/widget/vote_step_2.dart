import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/features/accreditation/view/accreditation_viewmodel.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/widgets/app_button.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class VoteStep2 extends ViewModelWidget<AccreditationViewModel> {
  const VoteStep2({super.key});

  @override
  Widget build(BuildContext context, AccreditationViewModel viewModel) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const OptionsAppBar(
            title: 'Voting Poll',
            subtitle: "Please complete a few tasks to make your vote count",
          ),
          Assets.stepFour.svg(
            width: 125,
            height: 12,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Step 2 of 4',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.7)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          InkWell(
            onTap: () => viewModel.authenticate(),
            child: Assets.icFingerprint.svg(
              height: 148,
              width: 148,
              fit: BoxFit.fill,
              color: (viewModel.isAuthenticated)
                  ? Colors.black
                  : const Color.fromARGB(255, 175, 166, 166),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Visibility(
            visible: viewModel.isAuthenticated,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppButton(
                onPressed_: () => viewModel.toElectionOptions(),
                height: 45,
                buttonColor: const Color(0xFF07A53D),
                buttonName: "Next",
                borderRadius: 10,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Visibility(
            visible: viewModel.isAuthenticated,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Fingerprint scan complete ",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Assets.icCorrect.svg(height: 20, width: 20),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
