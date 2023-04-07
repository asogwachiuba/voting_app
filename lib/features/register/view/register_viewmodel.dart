import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:voting_app/constants/election_data.dart';
import 'package:voting_app/core/app/app.locator.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/login/view/login_view.dart';
import 'package:voting_app/firebase/authentication.dart';
import 'package:voting_app/util/notification.dart';

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

  bool _isAmputee = false;
  bool get isAmputee => _isAmputee;
  set isAmputee(bool newValue) {
    _isAmputee = newValue;
    notifyListeners();
  }

  /// ==========================================================================

  /// Methods ==================================================================

  register() async {
    if (fullNameController.text.isEmpty ||
        ninController.text.isEmpty ||
        dobController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      AppNotification.error(error: "Fill in all the text fields");
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

    if (!isAuthenticated) {
      AppNotification.error(error: "Provide your fingerprint for registration");
      return;
    }

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
      profileImageUrl: "",
    );

    if (isUserRegistered) {
      toLogin();
    }
  }

  toLogin() {
    navigationService.navigateToView(const LoginView());
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
