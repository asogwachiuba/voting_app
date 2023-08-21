import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/constants/font.dart';
import 'package:voting_app/features/register/view/register_viewmodel.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/widgets/app_button.dart';

class Step2 extends ViewModelWidget<RegisterViwModel> {
  const Step2({super.key});

  @override
  Widget build(BuildContext context, RegisterViwModel viewModel) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const Text(
                "Get started!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please provide all details to start voting",
                style: TextStyle(
                  fontSize: CustomFont.smallestFontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Assets.icSteps
                  .svg(height: 12, width: 76, color: const Color(0xFF07A53D)),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Step 2 of 2",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: CustomFont.smallestFontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              // Profile image
              InkWell(
                onTap: () => viewModel.takePicture(),
                child: (viewModel.imageFile == null)
                    ? Container(
                        height: 102,
                        width: 102,
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
                          width: 102,
                          height: 102,
                          fit: BoxFit.fill,
                        ),
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                viewModel.imageFile != null
                    ? "Tap to retake Photo"
                    : "Tap to take a photo",
                style: const TextStyle(
                  fontSize: CustomFont.smallestFontSize,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              viewModel.busy(viewModel.processingImage)
                  ? const Center(
                      child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(strokeWidth: 2.0)))
                  : Text(
                      "Faces found: ${viewModel.faceCount}",
                      style: const TextStyle(
                        fontSize: CustomFont.smallestFontSize,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                      ),
                    ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFD9D9D9),
          thickness: 1,
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Device Authentication",
                style: TextStyle(
                  fontSize: CustomFont.smallestFontSize,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => (defaultTargetPlatform == TargetPlatform.iOS)
                    ? viewModel.faceAuthentication()
                    : viewModel.authenticate(),
                child: (defaultTargetPlatform != TargetPlatform.iOS)
                    ? Assets.icFingerprint.svg(
                        color: viewModel.isAuthenticated
                            ? Colors.black
                            : Colors.black.withOpacity(0.4),
                      )
                    : Assets.icFaceSvg.svg(
                        height: 140,
                        width: 140,
                        fit: BoxFit.fill,
                        color: viewModel.isFaceAuthenticated
                            ? Colors.black
                            : Colors.black.withOpacity(0.4),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (viewModel.isAuthenticated)
                    const Text(
                      'Successful',
                      style: TextStyle(color: ColorList.primaryColor),
                    ),
                  Checkbox(
                    value: viewModel.isAmputee,
                    onChanged: (_) => viewModel.toggleAmputee(),
                  ),
                  const SizedBox(width: 8.0),
                  const Text('I am an amputee'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => viewModel.register(),
                child: Container(
                  height: 45,
                  width: 261,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF07A53D),
                  ),
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible:
                    viewModel.isAuthenticated || viewModel.isFaceAuthenticated,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Fingerprint scan complete ",
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
    );
  }
}
