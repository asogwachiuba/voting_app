import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/reset_password/view/reset_password_viewmodel.dart';
import 'package:voting_app/features/reset_password/widget/password_requirement_tile.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewmodel>.reactive(
      viewModelBuilder: (() => ResetPasswordViewmodel()),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ColorList.darkGreen, ColorList.lightGreen],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Create new passwrod
                  TextFormField(
                    onChanged: (value) => setState(() {}),
                    controller: viewModel.createPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Create your new password',
                      hintStyle: const TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),

                  // Confirm new password
                  TextFormField(
                    controller: viewModel.confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Confirm your new password',
                      hintStyle: const TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 30),

                  Text(
                    viewModel.checkPasswordSimilarity()["message"],
                    style: TextStyle(
                      color: viewModel.checkPasswordSimilarity()["color"],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Password Requirements:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  PasswordRequirementTile(
                    requirement: "At least 1 Upper Case",
                    passed: (viewModel.createPasswordController.text
                        .contains(RegExp(r'[A-Z]'))),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PasswordRequirementTile(
                    passed: (viewModel.createPasswordController.text
                        .contains(RegExp(r'[a-z]'))),
                    requirement: "At least 1 Lower Case",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PasswordRequirementTile(
                    passed: (viewModel.createPasswordController.text
                        .contains(RegExp(r'[0-9]'))),
                    requirement: "At least 1 Number",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PasswordRequirementTile(
                    passed: (viewModel.createPasswordController.text
                        .contains(RegExp(r'[=!&@#%.]'))),
                    requirement: "At least 1 Special Character/Symbol",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PasswordRequirementTile(
                    passed:
                        (viewModel.createPasswordController.text.length >= 8),
                    requirement: "At least 8 Characters",
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  // Reset buton
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        height: 50,
                        onPressed: () => viewModel.updatePassword(),
                        color: Colors.white,
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                            color: ColorList.darkGreen.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
      ),
    );
  }
}
