import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/features/register/view/register_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/util/notification.dart';
import 'package:voting_app/widgets/app_button.dart';
import 'package:voting_app/widgets/app_loader.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Form(
                          key: viewModel.formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Voters Registration',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 32),

                                Center(
                                  child: Stack(
                                      clipBehavior: Clip.antiAlias,
                                      children: [
                                        CircleAvatar(
                                          radius: 60,
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.5),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child:
                                                  (viewModel.imageFile != null)
                                                      ? Image.file(
                                                          viewModel.imageFile!,
                                                          width: 115,
                                                          height: 115,
                                                          fit: BoxFit.fill,
                                                        )
                                                      : const Icon(
                                                          Icons.person,
                                                          color: Colors.black,
                                                          size: 100,
                                                        ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: InkWell(
                                            onTap: () =>
                                                viewModel.takePicture(),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    ColorList.darkGreen,
                                                radius: 15.0,
                                                child: InkWell(
                                                  onTap: () =>
                                                      viewModel.takePicture(),
                                                  child: const Icon(
                                                    Icons.camera_alt,
                                                    size: 14.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),

                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: viewModel.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: const Icon(Icons.email),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                Visibility(
                                  visible: viewModel.isNinVerified,
                                  child: TextFormField(
                                    controller: viewModel.fullNameController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      enabled: false,
                                      labelText: 'Full Name',
                                      prefixIcon: const Icon(
                                          Icons.person_outline_outlined),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your full name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: viewModel.ninController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 11,
                                  onChanged: (value) {
                                    if (value.length == 11) {
                                      viewModel.validateNIN();
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'NIN',
                                    prefixIcon: const Icon(Icons.pin),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your NIN';
                                    }
                                    return null;
                                  },
                                ),
                                /* Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Select profile picture button
                                    InkWell(
                                      onTap: () => viewModel.takePicture(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorList.primaryColor),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Select profile image",
                                            style: TextStyle(
                                              color: ColorList.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                                
                                    // Display image selected
                                    if (viewModel.imageFile != null)
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          viewModel.imageFile!,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                  ],
                                ), */
                                Visibility(
                                    visible: viewModel.isNinVerified,
                                    child: const SizedBox(height: 16)),
                                Visibility(
                                  visible: viewModel.isNinVerified,
                                  child: TextFormField(
                                    readOnly: viewModel.isNinVerified,
                                    controller: viewModel.phoneController,
                                    keyboardType: TextInputType.phone,
                                    maxLength: 11,
                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      enabled: false,
                                      prefixIcon: const Icon(Icons.phone),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your phone number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Visibility(
                                    visible: viewModel.isNinVerified,
                                    child: const SizedBox(height: 16)),
                                Visibility(
                                  visible: viewModel.isNinVerified,
                                  child: TextFormField(
                                    controller: viewModel.dobController,
                                    onTap: () async {
                                      /* DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      );
                                      if (date != null) {
                                        if (date.isUnderage()) {
                                          AppNotification.notify(
                                              notificationMessage:
                                                  "You need to be up to 18 years to vote");
                                          return;
                                        }
                                        viewModel.dobController.text =
                                            '${date.month}/${date.day}/${date.year}';
                                      } */
                                    },
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      enabled: false,
                                      labelText: 'Date of Birth',
                                      prefixIcon:
                                          const Icon(Icons.calendar_today),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your date of birth';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Visibility(
                                  visible: viewModel.isNinVerified,
                                  child: const SizedBox(
                                    height: 16,
                                  ),
                                ),
                                Visibility(
                                  visible: viewModel.isNinVerified,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      labelText: 'Select your gender',
                                      enabled: false,
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                    ),
                                    value: viewModel.gender,
                                    onChanged: ((value) =>
                                        viewModel.selectGender(gender_: value)),
                                    items: ["Male", "Female"].map((state) {
                                      return DropdownMenuItem(
                                        value: state,
                                        child: Text(
                                          state,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    labelText: 'Select State',
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  value: viewModel.selectedState,
                                  onChanged: ((value) =>
                                      viewModel.selectState(state: value)),
                                  items: viewModel.states.map((state) {
                                    return DropdownMenuItem(
                                      value: state,
                                      child: Text(
                                        state,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    labelText: 'Select Local Government',
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  value: viewModel.selectedLocalGovernment,
                                  onChanged: (value) =>
                                      viewModel.selectLocalGovernment(
                                          selectedLocalGovernment_: value),
                                  items: viewModel
                                      .displayLocalGovernment()
                                      .map((localGovernment) {
                                    return DropdownMenuItem(
                                      value: localGovernment,
                                      child: Text(
                                        localGovernment,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    labelText: 'Select Your Voting Ward',
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  value: viewModel.selectedWard,
                                  onChanged: (value) => viewModel.selectWard(
                                      selectedWard_: value),
                                  items: viewModel.displayWard().map((ward) {
                                    return DropdownMenuItem(
                                      value: ward,
                                      child: Text(
                                        ward,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    labelText: 'Select Polling Units',
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  value: viewModel.selectedPollingUnits,
                                  onChanged: (value) =>
                                      viewModel.selectPollingUnits(
                                          selectedPollingUnits_: value),
                                  items: viewModel
                                      .displayPollingUnits()
                                      .map((pollingUnit) {
                                    return DropdownMenuItem(
                                      value: pollingUnit,
                                      child: Text(
                                        pollingUnit,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 16),

                                // Fingerprint authentication
                                if (defaultTargetPlatform != TargetPlatform.iOS)
                                  Row(
                                    children: [
                                      const Text(
                                        "Register your fingerprint",
                                        style: TextStyle(
                                          color: Colors.black,
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
                                              color: viewModel.isAuthenticated
                                                  ? ColorList.primaryColor
                                                  : Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Icon(
                                            Icons.fingerprint,
                                            size: 34.0,
                                            color: viewModel.isAuthenticated
                                                ? ColorList.primaryColor
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (defaultTargetPlatform !=
                                            TargetPlatform.iOS &&
                                        viewModel.isAuthenticated)
                                      const Text(
                                        'Successful',
                                        style: TextStyle(
                                            color: ColorList.primaryColor),
                                      ),
                                    const Spacer(),
                                    Checkbox(
                                      value: viewModel.isAmputee,
                                      onChanged: (_) =>
                                          viewModel.toggleAmputee(),
                                    ),
                                    const SizedBox(width: 8.0),
                                    const Text('I am an amputee'),
                                  ],
                                ),

                                if (viewModel.hasFaceId)
                                  Row(
                                    children: [
                                      const Text(
                                        "Register your face ID",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () =>
                                            viewModel.faceAuthentication(),
                                        child: Container(
                                          padding: const EdgeInsets.all(4.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2.0,
                                              color:
                                                  viewModel.isFaceAuthenticated
                                                      ? ColorList.primaryColor
                                                      : Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Icon(
                                            Icons.face_retouching_natural,
                                            size: 34.0,
                                            color: viewModel.isFaceAuthenticated
                                                ? ColorList.primaryColor
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                if (!viewModel.hasFaceId)
                                  Row(
                                    children: [
                                      const Text(
                                        "Set up device face verification\nto register",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Text(
                                        'DONE',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      Checkbox(
                                          value: viewModel.hasFaceId,
                                          onChanged: (value) {
                                            AppNotification.notify(
                                                notificationMessage:
                                                    "Checking...");
                                            viewModel.isFaceIdAvaiable();
                                          }),
                                    ],
                                  ),

                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              onPressed_: viewModel.register,
                              buttonName: "Register",
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
