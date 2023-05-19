import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/features/registration_successful/view/registration_successful_viewmodel.dart';
import 'package:voting_app/gen/assets.gen.dart';

class RegistrationSuccessfulView extends StatefulWidget {
  const RegistrationSuccessfulView({super.key});

  @override
  State<RegistrationSuccessfulView> createState() =>
      _RegistrationSuccessfulViewState();
}

class _RegistrationSuccessfulViewState
    extends State<RegistrationSuccessfulView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationSuccessfulViewmodel>.reactive(
      viewModelBuilder: (() => RegistrationSuccessfulViewmodel()),
      builder: (context, viewModel, child) => Scaffold(
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
            child: Column(
              children: [
                const Text(
                  'Account Verification',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'A unique link has been sent to your email address,\nkindly tap on it to verify your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    height: 2.2,
                    fontSize: CustomFont.smallestFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Assets.icAccountVerification.svg(height: 240, fit: BoxFit.fill),
                const SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () => viewModel.toLogin(),
                  child: Container(
                    height: 45,
                    width: 261,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF07A53D),
                    ),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
