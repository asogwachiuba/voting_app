import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/register/view/register_viewmodel.dart';
import 'package:voting_app/models/enums/election_category.dart';
import 'package:voting_app/util/notification.dart';
import 'package:voting_app/widgets/app_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViwModel>.reactive(
      viewModelBuilder: (() => RegisterViwModel()),
      builder: (context, viewModel, child) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorList.darkGreen,
                ColorList.primaryColor,
                ColorList.lightGreen,
                Colors.white,
                Colors.white,
                Colors.white,
                ColorList.lightGreen,
                ColorList.primaryColor,
                ColorList.darkGreen,
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 32),
                            Text(
                              'Registration',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: ColorList.darkGreen.withOpacity(0.8),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            TextFormField(
                              controller: viewModel.emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
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
                            TextFormField(
                              controller: viewModel.fullNameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                prefixIcon:
                                    const Icon(Icons.person_outline_outlined),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: viewModel.ninController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'NIN',
                                prefixIcon: const Icon(Icons.pin),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your NIN';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: viewModel.phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                prefixIcon: const Icon(Icons.phone),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: viewModel.dobController,
                              onTap: () async {
                                DateTime? date = await showDatePicker(
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
                                }
                              },
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                labelText: 'Date of Birth',
                                prefixIcon: const Icon(Icons.calendar_today),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your date of birth';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField(
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: 'Select your gender',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
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
                            const SizedBox(height: 16),
                            DropdownButtonFormField(
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: 'Select State',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
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
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
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
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              value: viewModel.selectedWard,
                              onChanged: (value) =>
                                  viewModel.selectWard(selectedWard_: value),
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
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
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
                            Row(
                              children: [
                                const Text(
                                  "Register your fingerprint",
                                  style: TextStyle(
                                    color: Colors.grey,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (viewModel.isAuthenticated)
                                  const Text(
                                    'Successful',
                                    style: TextStyle(
                                        color: ColorList.primaryColor),
                                  ),
                                const Spacer(),
                                Checkbox(
                                  value: viewModel.isAmputee,
                                  onChanged: (_) => viewModel.toggleAmputee(),
                                ),
                                const SizedBox(width: 8.0),
                                const Text('I am an amputee'),
                              ],
                            ),

                            const SizedBox(
                              height: 40,
                            ),

                            AppButton(
                              onPressed_: viewModel.register,
                              buttonName: "Register",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
