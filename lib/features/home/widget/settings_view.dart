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
                              // controller: viewModel.nameController,
                              textInputAction: TextInputAction.done,
                              cursorColor: ColorList.lightGreen,
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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

                // Username Widget
                SizedBox(
                  //margin: EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            child: Text(
                              'Username',
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
                            //color: Colors.black,
                            child: TextFormField(
                              // enabled: viewModel.editUserName,
                              textCapitalization: TextCapitalization.words,
                              keyboardType: TextInputType.name,
                              // controller: viewModel.usernameController,
                              textInputAction: TextInputAction.done,
                              cursorColor: ColorList.lightGreen,
                              maxLines: 1,
                              onTap: () {},
                              onEditingComplete: () {},
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Not set yet!',
                                hintStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                alignLabelWithHint: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(height: 15),
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
                          const SizedBox(
                            child: Text(
                              "chiuba@hismail.com",
                              textAlign: TextAlign.right,
                              style: TextStyle(
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
                              child: GestureDetector(
                                onTap: () {
                                  // if(editPhone)
                                  // showPhoneDialog(context);
                                },
                                child: const Text(
                                  "09166198977",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    /* color: viewModel.editPhone
                                        ? ColorList.colorGray
                                        : ColorList.colorPrimary, */
                                  ),
                                ),
                              )),
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

                // Date of birth Widget
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
                              //color: Colors.black,
                              child: InkWell(
                            child: Text(
                              "Feb 4, 2023",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                /* color: (viewModel.stringDOB != null)
                                    ? ColorList.colorPrimary
                                    : ColorList.colorGray, */
                              ),
                            ),
                            onTap: () {
                              // openDOBSelector(context);
                            },
                          )),
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

                // Gender Widget
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Column(
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
                          GestureDetector(
                            onTap: () {
                              // showGenderModal(context);
                            },
                            child: Text(
                              "Male",
                              textAlign: TextAlign.right,
                              style: TextStyle(
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

                      // onTap: () => Navigator.pop(context, viewModel.status),
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

                      // onTap: () => Navigator.pop(context, viewModel.status),
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
