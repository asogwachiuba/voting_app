import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/features/register/view/register_viewmodel.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/widgets/app_button.dart';

import '../../../../constants/font.dart';

class Step1 extends ViewModelWidget<RegisterViwModel> {
  const Step1({super.key});

  @override
  Widget build(BuildContext context, RegisterViwModel viewModel) {
    return SingleChildScrollView(
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
            height: 15,
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
          Assets.icSteps.svg(height: 12, width: 76),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Step 1 of 2",
            style: TextStyle(
              color: Colors.black,
              fontSize: CustomFont.smallestFontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // Email
          TextFormField(
            controller: viewModel.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: CustomFont.smallestFontSize,
                fontWeight: FontWeight.w500,
              ),
              // prefixIcon: const Icon(Icons.email),
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
              ),
              constraints: const BoxConstraints.expand(height: 43),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),

          const SizedBox(
            height: 30,
          ),
          // NIN
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
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: CustomFont.smallestFontSize,
                fontWeight: FontWeight.w500,
              ),
              // prefixIcon: const Icon(Icons.pin),
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
              ),
              constraints: const BoxConstraints.expand(height: 63),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your NIN';
              }
              return null;
            },
          ),

          Visibility(
              visible: viewModel.isNinVerified,
              child: const SizedBox(height: 30)),

          // Phone number
          Visibility(
            visible: viewModel.isNinVerified,
            child: TextFormField(
              readOnly: viewModel.isNinVerified,
              controller: viewModel.fullNameController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: CustomFont.smallestFontSize,
                  fontWeight: FontWeight.w500,
                ),
                enabled: false,
                // prefixIcon: const Icon(Icons.phone),
                filled: true,
                fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                ),
                constraints: const BoxConstraints.expand(height: 50),
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
            child: const SizedBox(
              height: 30,
            ),
          ),

          // Phone number
          Visibility(
            visible: viewModel.isNinVerified,
            child: TextFormField(
              readOnly: viewModel.isNinVerified,
              controller: viewModel.phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: CustomFont.smallestFontSize,
                  fontWeight: FontWeight.w500,
                ),
                enabled: false,
                // prefixIcon: const Icon(Icons.phone),
                filled: true,
                fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                ),
                constraints: const BoxConstraints.expand(height: 50),
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
            child: const SizedBox(
              height: 30,
            ),
          ),

          // Date of birth
          Visibility(
            visible: viewModel.isNinVerified,
            child: TextFormField(
              controller: viewModel.dobController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                enabled: false,
                labelText: 'Date of Birth',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: CustomFont.smallestFontSize,
                  fontWeight: FontWeight.w500,
                ),
                // prefixIcon: const Icon(Icons.calendar_today),
                filled: true,
                fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                ),
                constraints: const BoxConstraints.expand(height: 43),
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
              height: 30,
            ),
          ),

          // Gender
          Visibility(
            visible: viewModel.isNinVerified,
            child: DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'Select your gender',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: CustomFont.smallestFontSize,
                  fontWeight: FontWeight.w500,
                ),
                enabled: false,
                filled: true,
                fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                ),
                // constraints: const BoxConstraints.expand(height: 43),
              ),
              value: viewModel.gender,
              onChanged: ((value) => viewModel.selectGender(gender_: value)),
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

          const SizedBox(height: 30),

          // Select state
          DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Select State',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: CustomFont.smallestFontSize,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
              ),
              // constraints: const BoxConstraints.expand(height: 60),
            ),
            value: viewModel.selectedState,
            onChanged: ((value) => viewModel.selectState(state: value)),
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
          const SizedBox(height: 30),

          // Select local govt.
          DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Select Local Government',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: CustomFont.smallestFontSize,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
              ),
              // constraints: const BoxConstraints.expand(height: 43),
            ),
            value: viewModel.selectedLocalGovernment,
            onChanged: (value) => viewModel.selectLocalGovernment(
                selectedLocalGovernment_: value),
            items: viewModel.displayLocalGovernment().map((localGovernment) {
              return DropdownMenuItem(
                value: localGovernment,
                child: Text(
                  localGovernment,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),

          // Select voting ward
          DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Select Your Voting Ward',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: CustomFont.smallestFontSize,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
              ),
              // constraints: const BoxConstraints.expand(height: 43),
            ),
            value: viewModel.selectedWard,
            onChanged: (value) => viewModel.selectWard(selectedWard_: value),
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
          const SizedBox(height: 30),

          // Select polling units
          DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Select Polling Units',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: CustomFont.smallestFontSize,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.42),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
              ),
              // constraints: const BoxConstraints.expand(height: 43),
            ),
            value: viewModel.selectedPollingUnits,
            onChanged: (value) =>
                viewModel.selectPollingUnits(selectedPollingUnits_: value),
            items: viewModel.displayPollingUnits().map((pollingUnit) {
              return DropdownMenuItem(
                value: pollingUnit,
                child: Text(
                  pollingUnit,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 50),

          InkWell(
            onTap: () => viewModel.nextStep(),
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

          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
