import 'package:voting_app/core/voting_app_viewmodel.dart';

class HomeViewModel extends VotingAppViewmodel {
  /// States and variables ==================================
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int newValue) {
    _selectedIndex = newValue;
    notifyListeners();
  }

  /// ========================================================

  /// Methods ================================================

  void onItemTapped(int index) {
    selectedIndex = index;
  }
}
