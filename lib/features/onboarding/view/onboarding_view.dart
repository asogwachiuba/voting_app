import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/onboarding/view/onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewmodel>.reactive(
      viewModelBuilder: (() => OnboardingViewmodel()),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorList.darkGreen.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          padding: EdgeInsets.all(24.0),
                          child: Icon(
                            viewModel.icons[viewModel.currentIndex],
                            size: 120.0,
                            color: ColorList.darkGreen.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          viewModel.titles[viewModel.currentIndex],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          viewModel.subtitles[viewModel.currentIndex],
                          style: TextStyle(
                            fontSize: 24.0,
                            color: ColorList.darkGreen.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed:
                          viewModel.currentIndex == viewModel.titles.length - 1
                              ? viewModel.toRegister
                              : viewModel.skip,
                      child: Text(
                        viewModel.currentIndex == viewModel.titles.length - 1
                            ? 'Register'
                            : 'SKIP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: ColorList.darkGreen.withOpacity(0.7),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed:
                          viewModel.currentIndex == viewModel.titles.length - 1
                              ? viewModel.toLogin
                              : viewModel.next,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 16.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        primary: ColorList.darkGreen.withOpacity(0.7),
                      ),
                      child: Text(
                        viewModel.currentIndex == viewModel.titles.length - 1
                            ? 'Log In'
                            : 'NEXT',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
