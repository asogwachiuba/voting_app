import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/features/onboarding/view/onboarding_viewmodel.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/widgets/app_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> icons = [
      Assets.onboarding1.image(
        height: MediaQuery.of(context).size.height * 0.35,
        fit: BoxFit.fill,
      ),
      Assets.onboarding2.image(
        height: MediaQuery.of(context).size.height * 0.35,
        fit: BoxFit.fill,
      ),
      Assets.onboarding3.image(
        height: MediaQuery.of(context).size.height * 0.35,
        fit: BoxFit.fill,
      ),
    ];
    return ViewModelBuilder<OnboardingViewmodel>.reactive(
      viewModelBuilder: (() => OnboardingViewmodel()),
      builder: (context, viewModel, child) {
        TapGestureRecognizer tapRecognizer = TapGestureRecognizer()
          ..onTap = () => viewModel.toLogin();
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: viewModel.currentIndex != 2,
                  child: InkWell(
                    onTap: () => viewModel.currentIndex = 2,
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF07A53D)),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                icons[viewModel.currentIndex],
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 6,
                      width: viewModel.currentIndex == 0 ? 32 : 21,
                      decoration: BoxDecoration(
                          color: viewModel.currentIndex == 0
                              ? const Color(0xFF455A64)
                              : const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 6,
                      width: viewModel.currentIndex == 1 ? 32 : 21,
                      decoration: BoxDecoration(
                          color: viewModel.currentIndex == 1
                              ? const Color(0xFF455A64)
                              : const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 6,
                      width: viewModel.currentIndex == 2 ? 32 : 21,
                      decoration: BoxDecoration(
                          color: viewModel.currentIndex == 2
                              ? const Color(0xFF455A64)
                              : const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Text(
                  viewModel.titles[viewModel.currentIndex],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  viewModel.subtitles[viewModel.currentIndex],
                  style: TextStyle(
                    fontSize: CustomFont.smallestFontSize,
                    color: ColorList.darkGreen.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60.0),
                AppButton(
                  onPressed_:
                      viewModel.currentIndex == viewModel.titles.length - 1
                          ? viewModel.toRegister
                          : viewModel.next,
                  buttonName:
                      viewModel.currentIndex == viewModel.titles.length - 1
                          ? 'Register'
                          : 'Next',
                  borderRadius: 10,
                  buttonColor: const Color(0xFF07A53D),
                  width: 261,
                  height: 45,
                ),
                const SizedBox(
                  height: 5,
                ),
                if (viewModel.currentIndex == 2)
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                            fontSize: CustomFont.smallestFontSize,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: " Login here",
                          style: const TextStyle(
                            fontSize: CustomFont.smallestFontSize,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF07A53D),
                          ),
                          recognizer: tapRecognizer,
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
