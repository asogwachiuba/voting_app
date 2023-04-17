import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/accreditation/view/accreditation_viewmodel.dart';
import 'package:voting_app/features/home/widget/dashboard_background_painter.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/widgets/app_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

//TODO: A typing text saying "A free and fair is what we all deserve and yearn for. Lets work together to achieve it"
class AccreditationView extends StatelessWidget {
  const AccreditationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccreditationViewModel>.reactive(
      viewModelBuilder: (() => AccreditationViewModel()),
      builder: (context, viewModel, child) => Scaffold(
        body: SizedBox.expand(
            child: Stack(
          children: [
            CustomPaint(
              size: const Size(double.infinity, double.infinity),
              painter: DashboardBackgroundPainter(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: Card(
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: ColorList.darkGreen,
                            ),
                            onPressed: () => viewModel.back(),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Election Accreditation",
                        style: TextStyle(
                          color: ColorList.lightGreen,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  // Fingerprint authentication
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Confirm your fingerprint",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => viewModel.authenticate(),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: const Icon(
                              Icons.fingerprint,
                              size: 34.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (viewModel.isAuthenticated)
                    const Text(
                      'Confirmed',
                      style: TextStyle(color: Colors.white),
                    ),

                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    onChanged: (value) => viewModel.validateNIN(nin: value),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'NIN',
                      prefixIcon: const Icon(Icons.pin),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: ColorList.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: ColorList.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: ColorList.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    viewModel.ninIsVerified ? 'Confirmed' : 'Verify your NIN',
                    style: TextStyle(
                        color: viewModel.ninIsVerified
                            ? Colors.white
                            : Colors.red),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  if (viewModel.isAuthenticated && viewModel.ninIsVerified)
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            onPressed_: () {
                              viewModel.toElectionOptions();
                            },
                            buttonName: "Validation Complete",
                            buttonColor: ColorList.primaryColor,
                          ),
                        ),
                      ],
                    ),

                  const Spacer(),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
