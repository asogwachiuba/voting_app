import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/features/accreditation/view/accreditation_viewmodel.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/widgets/app_button.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class VoteStep2 extends ViewModelWidget<AccreditationViewModel> {
  const VoteStep2({super.key});

  @override
  Widget build(BuildContext context, AccreditationViewModel viewModel) {
    return SafeArea(
        child: SingleChildScrollView(
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
                    fontSize: CustomFont.smallestFontSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.7)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Face Verification',
                style: TextStyle(
                    fontSize: CustomFont.mediumFontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7)),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () => viewModel.takePicture(),
                child: (viewModel.imageFile == null)
                    ? Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromRGBO(217, 217, 217, 0.45),
                    border: Border.all(
                      color: const Color.fromRGBO(0, 0, 0, 0.1),
                    ),
                  ),
                  child: Center(
                    child: Assets.icCamera.svg(height: 22.5, width: 25),
                  ),
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(51),
                  child: Image.file(
                    viewModel.imageFile!,
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: !viewModel.busy(viewModel.processingImage),
                child: Text(
                  viewModel.imageFile != null
                      ? "Tap to retake Photo"
                      : "Tap to take a photo",
                  style: const TextStyle(
                    fontSize: CustomFont.smallestFontSize,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              viewModel.busy(viewModel.processingImage)
                  ? const Center(
                  child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(strokeWidth: 2.0)))
                  : const SizedBox(),
              const SizedBox(
                height: 5,
              ),
              // InkWell(
              //   onTap: () => (defaultTargetPlatform == TargetPlatform.iOS)
              //       ? viewModel.faceAuthentication()
              //       : viewModel.authenticate(),
              //   child: Assets.icFingerprint.svg(
              //     height: 148,
              //     width: 148,
              //     fit: BoxFit.fill,
              //     color: (viewModel.isAuthenticated)
              //         ? Colors.black
              //         : const Color.fromARGB(255, 175, 166, 166),
              //   ),
              // ),
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
                      "Face Verification completed ",
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
        ));
  }
}
