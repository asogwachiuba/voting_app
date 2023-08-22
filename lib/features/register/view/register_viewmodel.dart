import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:voting_app/constants/election_data.dart';
import 'package:voting_app/core/app/app.locator.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/registration_successful/view/registration_successful_view.dart';
import 'package:voting_app/firebase/authentication.dart';
import 'package:voting_app/util/notification.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:intl/intl.dart';

class RegisterViwModel extends VotingAppViewmodel {
  /// Dependency Injection =====================================================
  final authentication = locator<Authentication>();

  /// ==========================================================================

  /// States and variables =====================================================

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController ninController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  bool fingerprintEnabled = false;
  bool isNinVerified = false;

  bool _isRegistering = false;

  bool get isRegistering => _isRegistering;

  set isRegistering(bool newValue) {
    _isRegistering = newValue;
    notifyListeners();
  }

  int? _selectedStateIndex;

  int? get selectedStateIndex => _selectedStateIndex;

  set selectedStateIndex(int? newValue) {
    _selectedStateIndex = newValue;
    notifyListeners();
  }

  String? _selectedState;

  String? get selectedState => _selectedState;

  set selectedState(String? newValue) {
    _selectedState = newValue;
    notifyListeners();
  }

  String? _selectedWard;

  String? get selectedWard => _selectedWard;

  set selectedWard(String? newValue) {
    _selectedWard = newValue;
    notifyListeners();
  }

  int _currentStep = 0;

  int get currentStep => _currentStep;

  set currentStep(int newValue) {
    _currentStep = newValue;
    notifyListeners();
  }

  String? _gender;

  String? get gender => _gender;

  set gender(String? newValue) {
    _gender = newValue;
    notifyListeners();
  }

  String? _selectedLocalGovernment;

  String? get selectedLocalGovernment => _selectedLocalGovernment;

  set selectedLocalGovernment(String? newValue) {
    _selectedLocalGovernment = newValue;
    notifyListeners();
  }

  String? _selectedPollingUnits;

  String? get selectedPollingUnits => _selectedPollingUnits;

  set selectedPollingUnits(String? newValue) {
    _selectedPollingUnits = newValue;
    notifyListeners();
  }

  Map<String, dynamic>? _selectedWardData;

  Map<String, dynamic>? get selectedWardData => _selectedWardData;

  set selectedWardData(Map<String, dynamic>? newValue) {
    _selectedWardData = newValue;
    notifyListeners();
  }

  Map<String, dynamic>? _selectedLocalGovernmentData;

  Map<String, dynamic>? get selectedLocalGovernmentData =>
      _selectedLocalGovernmentData;

  set selectedLocalGovernmentData(Map<String, dynamic>? newValue) {
    _selectedLocalGovernmentData = newValue;
    notifyListeners();
  }

  List<String> get states => ElectionData.states;

  List<Map<String, dynamic>>? _selectedStateData = [];

  List<Map<String, dynamic>>? get selectedStateData => _selectedStateData;

  set selectedStateData(List<Map<String, dynamic>>? newValue) {
    _selectedStateData = newValue;
    notifyListeners();
  }

  final localAuthentication = LocalAuthentication();

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool newValue) {
    _isAuthenticated = newValue;
    notifyListeners();
  }

  bool _isFaceAuthenticated = false;

  bool get isFaceAuthenticated => _isFaceAuthenticated;

  set isFaceAuthenticated(bool newValue) {
    _isFaceAuthenticated = newValue;
    notifyListeners();
  }

  bool _isAmputee = false;

  bool get isAmputee => _isAmputee;

  set isAmputee(bool newValue) {
    _isAmputee = newValue;
    notifyListeners();
  }

  File? _imageFile;

  File? get imageFile => _imageFile;

  set imageFile(File? newValue) {
    _imageFile = newValue;
    notifyListeners();
  }

  bool _hasFaceId = false;

  bool get hasFaceId => _hasFaceId;

  set hasFaceId(bool newValue) {
    _hasFaceId = newValue;
    notifyListeners();
  }

  Map<String, dynamic> _userNINDatabaseInfo = {};

  Map<String, dynamic> get userNINDatabaseInfo => _userNINDatabaseInfo;

  set userNINDatabaseInfo(Map<String, dynamic> newValue) {
    _userNINDatabaseInfo = newValue;
    notifyListeners();
  }

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
    ),
  );

  int _faceCount = 0;
  int get faceCount => _faceCount;

  /// ==========================================================================

  /// Methods ==================================================================

  onReady() {
    isFaceIdAvailable();
  }

  nextStep() {
    if (fullNameController.text.isEmpty ||
        ninController.text.isEmpty ||
        dobController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      AppNotification.error(error: "Fill in all the text fields");
      return;
    }

    if (!isNinVerified) {
      AppNotification.error(error: "Verify your NIN");
      return;
    }

    if (ninController.text != userNINDatabaseInfo['nin']) {
      AppNotification.error(
          error: "NIN has been updated after validation. Re-validate your NIN");
      // Enables user to re-validate NIN
      isNinVerified = false;

      return;
    }

    if (gender == null || gender!.isEmpty) {
      AppNotification.error(error: "Select your gender");
      return;
    }

    if (selectedState == null ||
        selectedLocalGovernment == null ||
        selectedWard == null ||
        selectedPollingUnits == null) {
      AppNotification.error(error: "Provide your election location details");
      return;
    }

    // Goes to next step
    currentStep = 1;
  }

  validateNIN() async {
    if (ninController.text.length < 11) {
      AppNotification.error(error: "NIN should have 11 digits");
      return;
    }

    if (isNinVerified) {
      AppNotification.notify(notificationMessage: "NIN is already verified");
      return;
    }
    userNINDatabaseInfo =
        await db.getUserNinDatabaseProfile(nin: ninController.text) ?? {};
    // Checks if NIN is already registered
    if (userNINDatabaseInfo['isRegisteredVoter'] == true) {
      AppNotification.error(error: "NIN profile is already a registered voter");
      userNINDatabaseInfo.clear();
      return;
    }
    if (userNINDatabaseInfo.isEmpty) {
      isNinVerified = false;
      logger.d({
        "The nin is: ${ninController.text} and the response is $userNINDatabaseInfo"
      });
      AppNotification.error(error: "NIN not valid. Enter your NIN correctly");
    } else {
      isNinVerified = true;
      final nin = <String, String>{'nin': ninController.text};
      userNINDatabaseInfo.addEntries(nin.entries);
      logger.d({
        "The nin is: ${ninController.text} and the response is $userNINDatabaseInfo"
      });
      AppNotification.notify(notificationMessage: "NIN validation successful.");
      updateUserInfoWithNIN();
    }
  }

  updateUserInfoWithNIN() {
    fullNameController.text =
        "${userNINDatabaseInfo['lastName']} ${userNINDatabaseInfo['firstName']}";
    phoneController.text = "${userNINDatabaseInfo['phoneNumber']}";
    final f = DateFormat('yyyy-MM-dd');

    // Date of birth validation
    final dob = DateTime.parse(userNINDatabaseInfo['dateOfBirth']);
    if (DateTime.now().year - dob.year < 18) {
      isNinVerified = false;
      AppNotification.error(
          error: "Your not up to 18 years. You are not qualified to vote");
      return;
    }
    dobController.text = f.format(dob);
    gender = userNINDatabaseInfo['gender'];
  }

  takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      notifyListeners();

      if(_imageFile != null) _processImage(_imageFile!);
    }
  }

  final String processingImage = "ProcessingImage....";

  Future<void> _processImage(File imageFile) async {
    setBusyForObject(processingImage, true);

    //Get inputImage for ML
    final inputImage = InputImage.fromFilePath(imageFile.path);

    final faces = await _faceDetector.processImage(inputImage);
    _faceCount = faces.length;

    setBusyForObject(processingImage, false);
  }

  isFaceIdAvailable() async {
    final List<BiometricType> availableBiometrics =
        await localAuthentication.getAvailableBiometrics();

    logger.d(availableBiometrics.toString());

    if (availableBiometrics.contains(BiometricType.face)) {
      hasFaceId = true;
      logger.d(availableBiometrics.toString());
      return;
    }

    // AppNotification.error(error: 'No Face ID setup');
  }

  faceAuthentication() async {
    if (isFaceAuthenticated) return;
    try {
      isFaceAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Please validate with your face',
          options: const AuthenticationOptions(useErrorDialogs: false));
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        AppNotification.error(
            error:
                "Your device does not support face verification. Please use another device");
      } else if (e.code == auth_error.notEnrolled) {
        AppNotification.error(
            error:
                "Setup your face verification in your device to enable you register.");
      } else {
        AppNotification.error(error: "Authentication failed, try again.");
      }
    }
  }

  register() async {
    if (imageFile == null) {
      AppNotification.notify(
          notificationMessage:
              "Provide your profile picture for identification");
      return;
    }

    if(faceCount == 0) {
      AppNotification.notify(
          notificationMessage:
              "Please provide a valid profile picture with your face visible");
      return;
    }

    if(faceCount > 1) {
      AppNotification.notify(
          notificationMessage:
          "Please provide a valid profile picture with only your face visible");
      return;
    }

    if (defaultTargetPlatform != TargetPlatform.iOS && !isAuthenticated) {
      AppNotification.error(error: "Provide your fingerprint for registration");
      return;
    }

    if (defaultTargetPlatform == TargetPlatform.iOS && !isFaceAuthenticated) {
      AppNotification.error(error: "Face ID registration required");
      return;
    }
    isRegistering = true;

    // Registers user
    bool isUserRegistered = await authentication.register(
      email: emailController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      fullName: fullNameController.text.trim(),
      dateOfBirth: dobController.text.trim(),
      electionState: selectedState!,
      electionLocalGovernment: selectedLocalGovernment!,
      electionWard: selectedWard!,
      electionPollingUnits: selectedPollingUnits!,
      isAmputee: isAmputee,
      nin: ninController.text,
      gender: gender!,
      profileImage: imageFile!,
    );
    isRegistering = false;
    if (isUserRegistered) {
      toRegistrationSuccessful();
    }
  }

  toRegistrationSuccessful() {
    navigationService.navigateToView(const RegistrationSuccessfulView());
  }

  authenticate() async {
    if (isAuthenticated) return;
    try {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: isAmputee
            ? 'Provide your device password for election validation'
            : 'Provide your fingerprint for election validation',
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: !isAmputee,
        ),
      );
    } on PlatformException catch (e) {
      logger.d('Error: $e');
    }
  }

  selectGender({required String? gender_}) {
    if (gender_ == null) return;
    gender = gender_;
  }

  toggleAmputee() {
    isAmputee = !isAmputee;
  }

  selectState({
    required String? state,
  }) {
    if (state == null) return;
    selectedState = state;
    selectedPollingUnits = null;
    selectedWard = null;
    selectedWardData = null;
    selectedLocalGovernment = null;
    selectedLocalGovernmentData = null;
    selectedStateIndex = states.indexWhere((element) => state == element);
    updateSelectedStateData();
  }

  selectPollingUnits({required String? selectedPollingUnits_}) {
    if (selectedPollingUnits_ == null) return;
    selectedPollingUnits = selectedPollingUnits_;
  }

  updateSelectedStateData() {
    selectedStateData = (selectedStateIndex == null)
        ? []
        : ElectionData.pollingUnits[selectedStateIndex!][selectedState];
  }

  selectLocalGovernment({required String? selectedLocalGovernment_}) {
    if (selectedLocalGovernment_ == null) return;
    selectedLocalGovernment = selectedLocalGovernment_;
    selectedPollingUnits = null;
    selectedWard = null;
    selectedWardData = null;
    updateSelectedLocalGovernmentData();
  }

  updateSelectedLocalGovernmentData() {
    selectedLocalGovernmentData = selectedStateData?.firstWhere((element) {
      return element["local_government"] == selectedLocalGovernment;
    });
  }

  selectWard({required String? selectedWard_}) {
    if (selectedWard_ == null) return;
    selectedWard = selectedWard_;
    selectedPollingUnits = null;
    updateSelectedWardData();
  }

  updateSelectedWardData() {
    if (selectedLocalGovernmentData == null ||
        selectedLocalGovernmentData!.isEmpty) {
      return;
    }
    List<Map<String, dynamic>> wards = selectedLocalGovernmentData!["wards"];
    selectedWardData =
        wards.firstWhere((element) => element["ward_name"] == selectedWard);
  }

  List<String> displayLocalGovernment() {
    if (selectedStateData == null || selectedStateData!.isEmpty) {
      return [];
    } else {
      List<String> lga = [];
      for (var element in selectedStateData!) {
        lga.add(element["local_government"]);
      }
      return lga;
    }
  }

  List<String> displayWard() {
    if (selectedLocalGovernmentData == null ||
        selectedLocalGovernmentData!.isEmpty) {
      return [];
    } else {
      List<String> wards = [];
      List<Map<String, dynamic>>? wardData =
          selectedLocalGovernmentData!['wards'];
      if (wardData != null || wardData!.isEmpty) {
        for (var element in wardData) {
          wards.add(element["ward_name"]);
        }
      }
      return wards;
    }
  }

  List<String> displayPollingUnits() {
    if (selectedWardData == null || selectedWardData!.isEmpty) {
      return [];
    } else {
      return selectedWardData!["polling_units"];
    }
  }
}
