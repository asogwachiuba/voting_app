import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/features/accreditation/view/accreditation_viewmodel.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/widgets/app_button.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class VoteStep1 extends ViewModelWidget<AccreditationViewModel> {
  const VoteStep1({super.key});

  @override
  Widget build(BuildContext context, AccreditationViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const OptionsAppBar(
            title: 'Voting Poll',
            subtitle: "Please complete a few tasks to make your vote count",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                Assets.stepOne.svg(
                  width: 125,
                  height: 12,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Step 1 of 4',
                  style: TextStyle(
                      fontSize: CustomFont.smallestFontSize,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Assets.onboarding1.image(
                  height: 227,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  onChanged: (value) {
                    if (value.length != 11) {
                      return;
                    }
                    viewModel.validateNIN(nin: value);
                  },
                  keyboardType: TextInputType.number,
                  cursorHeight: 10,
                  maxLength: 11,
                  style: const TextStyle(
                    fontSize: CustomFont.smallestFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Enter your NIN here',
                    labelStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                    ),
                    // constraints: const BoxConstraints.expand(height: 50),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your NIN';
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Visibility(
                  visible: viewModel.ninIsVerified,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppButton(
                      onPressed_: () => viewModel.toNextStep(),
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
                  visible: viewModel.ninIsVerified,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "NIN has been confirmed ",
                        style: TextStyle(
                          fontSize: CustomFont.smallestFontSize,
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
          ),
        ],
      ),
    );
  }
}
