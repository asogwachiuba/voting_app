import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/register/view/register_viewmodel.dart';

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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
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
                            decoration: InputDecoration(
                              labelText: 'Select State',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            value: viewModel.selectedState,
                            onChanged: ((value) =>
                                viewModel.selectState(state: value)),
                            items: viewModel.states.map((lga) {
                              return DropdownMenuItem(
                                value: lga,
                                child: Text(lga),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField(
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
                            items:
                                viewModel.displayLocalGovernment().map((ward) {
                              return DropdownMenuItem(
                                value: ward,
                                child: Text(ward),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Select Your Voting Ward',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            value: viewModel.selectedWard,
                            onChanged: (value) =>
                                viewModel.selectWard(selectedWard_: value),
                            items: viewModel.displayWard().map((pu) {
                              return DropdownMenuItem(
                                value: pu,
                                child: Text(pu),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16),
                          if (viewModel.selectedWard != null)
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                labelText: 'Select Polling Unit',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              value: viewModel.selectedPollingUnits,
                              onChanged: (value) =>
                                  viewModel.selectPollingUnits(
                                      selectedPollingUnits_: value),
                              items:
                                  viewModel.displayPollingUnits().map((state) {
                                return DropdownMenuItem(
                                  value: state,
                                  child: Text(state),
                                );
                              }).toList(),
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
    );
  }
}
