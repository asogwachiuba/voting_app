import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/constants/keys.dart';
import 'package:voting_app/features/login/view/login_viewmodel.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/widgets/app_button.dart';
import 'package:voting_app/widgets/app_loader.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: (() => LoginViewModel()),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: viewModel.isLoggingIn
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLoader(),
                    Text(
                      "Logging in ...",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                )
              : SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Please enter your mail address and the password,\nas seen below',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          height: 2.2,
                          fontSize: CustomFont.smallestFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: viewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorHeight: 12,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            fontSize: CustomFont.smallestFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 8),
                            child: Assets.icEmail.image(),
                          ),
                          filled: true,
                          fillColor:
                              const Color.fromRGBO(217, 217, 217, 0.42),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.1)),
                          ),
                          constraints:
                              const BoxConstraints.expand(height: 43),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(Keys.emailRegEx).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: viewModel.passwordController,
                        obscureText: true,
                        style: const TextStyle(
                          fontSize: CustomFont.smallestFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorHeight: 12,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 8),
                            child: Assets.icLock.svg(),
                          ),
                          filled: true,
                          fillColor:
                              const Color.fromRGBO(217, 217, 217, 0.42),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.1)),
                          ),
                          constraints:
                              const BoxConstraints.expand(height: 43),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      // if (viewModel.isNewUser ?? false)
                      //   const SizedBox(
                      //     height: 25,
                      //   ),
                      // if (viewModel.isNewUser ?? false)
                      //   const Align(
                      //     alignment: Alignment.topLeft,
                      //     child: Text(
                      //       "Your password is ${Keys.generalPassword}",
                      //       style: TextStyle(
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 10,
                      //       ),
                      //     ),
                      //   ),
                      const SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AppButton(
                          onPressed_: () {
                            if (viewModel.formKey.currentState!.validate()) {
                              viewModel.login();
                            }
                          },
                          height: 45,
                          buttonColor: const Color(0xFF07A53D),
                          buttonName: "Login",
                          borderRadius: 10,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          viewModel.toForgotPassword();
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorList.darkGreen.withOpacity(0.8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
