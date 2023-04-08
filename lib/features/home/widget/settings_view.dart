import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/widget/settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: (() => SettingsViewModel()),
      onViewModelReady: (viewModel) => viewModel.onReady(),
      builder: ((context, viewModel, child) => Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                // Title text widget
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: Color(0xFFE2E5FF),
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 40,
                ),

                // Profile Image and update image widgets
                InkWell(
                  onTap: () {
                    // showPicker(context, true);
                  },
                  child: const Center(
                    child: CircleAvatar(
                      radius: 55.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 56.0,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: ColorList.lightGreen,
                            radius: 15.0,
                            child: Icon(
                              Icons.camera_alt,
                              size: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Personal Information widget
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full name widget
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            child: Text(
                              'Full Name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: screenSize.width * 0.6,
                            child: TextFormField(
                              textCapitalization: TextCapitalization.words,
                              keyboardType: TextInputType.name,
                              controller: viewModel.fullNameController,
                              textInputAction: TextInputAction.done,
                              cursorColor: ColorList.lightGreen,
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Full name',
                                hintStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                alignLabelWithHint: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(height: 10),
                      const Divider(
                        thickness: 1,
                        color: Color(0xFFE2E5FF),
                      )
                    ],
                  ),
                ),

                // Email Widget
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            child: Text(
                              'Email',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            child: Text(
                              viewModel.email,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        thickness: 1,
                        color: Color(0xFFE2E5FF),
                      )
                    ],
                  ),
                ),

                // Phone number Widget
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          child: Text(
                            'Phone Number',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: screenSize.width * 0.6,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.name,
                            controller: viewModel.phoneController,
                            textInputAction: TextInputAction.done,
                            cursorColor: ColorList.lightGreen,
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Edit your phone number',
                              hintStyle: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 10),
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFE2E5FF),
                    )
                  ],
                ),

                // Date of birth Widget
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          child: Text(
                            'Date of Birth',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: screenSize.width * 0.6,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.name,
                            controller: viewModel.dobController,
                            textInputAction: TextInputAction.done,
                            cursorColor: ColorList.lightGreen,
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Edit your date of birth',
                              hintStyle: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 10),
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFE2E5FF),
                    )
                  ],
                ),

                // Gender Widget
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          child: Text(
                            'Gender',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: screenSize.width * 0.6,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.name,
                            controller: viewModel.genderController,
                            textInputAction: TextInputAction.done,
                            cursorColor: ColorList.lightGreen,
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Edit your gender',
                              hintStyle: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 10),
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFE2E5FF),
                    )
                  ],
                ),

                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        width: screenSize.width * 0.4,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: ColorList.primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Discard',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: ColorList.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      onTap: () => viewModel.discard(),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      child: Container(
                        width: screenSize.width * 0.4,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: ColorList.primaryColor,
                          border: Border.all(width: 0, color: Colors.white),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Save Profile',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onTap: () => viewModel.saveProfile(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ))),
    );
  }
}
