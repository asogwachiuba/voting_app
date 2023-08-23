import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:voting_app/features/register/view/register_viewmodel.dart';
import 'package:voting_app/features/register/view/widgets/step1.dart';
import 'package:voting_app/features/register/view/widgets/step2.dart';
import 'package:voting_app/widgets/app_loader.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [const Step1(), const Step2()];
    return ViewModelBuilder<RegisterViwModel>.reactive(
      viewModelBuilder: (() => RegisterViwModel()),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, child) => Scaffold(
        body: viewModel.isRegistering
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLoader(),
                  Text(
                    "Registration is ongoing",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )
                ],
              )
            : SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: viewModel.currentStep == 0 ? 30 : 0),
                  child: steps[viewModel.currentStep],
                ),
              ),
      ),
    );
  }
}
