import 'package:flutter/material.dart';
import 'package:voting_app/constants/election_data.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';

class RegisterViwModel extends VotingAppViewmodel {
  /// Dependency Injection =====================================================

  /// ==========================================================================

  /// States and variables =====================================================

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
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

  /// ==========================================================================

  /// Methods ==================================================================

  selectState({
    required String? state,
  }) {
    if (state == null) return;
    selectedState = state;
    selectedLocalGovernment = null;
    selectedWard = null;
    selectedLocalGovernmentData = null;
    selectedWardData = null;
    // selectedPollingUnits = null;
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
    selectedWard = null;
    selectedWardData = null;
    // selectedPollingUnits = null;
    selectedLocalGovernment = selectedLocalGovernment_;
    updateSelectedLocalGovernmentData();
  }

  updateSelectedLocalGovernmentData() {
    selectedLocalGovernmentData = selectedStateData?.firstWhere((element) {
      return element["local_government"] == selectedLocalGovernment;
    });
  }

  selectWard({required String? selectedWard_}) {
    if (selectedWard_ == null) return;
    // selectedPollingUnits = null;
    selectedWard = selectedWard_;
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
      List<Map<String, dynamic>> wardData =
          selectedLocalGovernmentData!['wards'];
      for (var element in wardData) {
        wards.add(element["ward_name"]);
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

  ///
}
