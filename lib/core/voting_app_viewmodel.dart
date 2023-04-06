import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:voting_app/core/app/app.locator.dart';
import 'package:voting_app/firebase/database.dart';

class VotingAppViewmodel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final db = locator<Database>();
}
