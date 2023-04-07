import 'package:hive_flutter/hive_flutter.dart';
import 'package:voting_app/models/user/voter.dart';

part 'votingapp_user.g.dart';

@HiveType(typeId: 1)
class VotingappUser extends HiveObject {
  @HiveField(0)
  final String? fullName;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  String? nin;
  @HiveField(3)
  String? phoneNumber;
  @HiveField(4)
  String? profileImageUrl;
  @HiveField(5)
  String? electionState;
  @HiveField(6)
  String? electionLocalGovernment;
  @HiveField(7)
  String? electionWard;
  @HiveField(8)
  String? electionPollingUnits;
  @HiveField(9)
  String? gender;
  @HiveField(10)
  bool? isAmputee;
  @HiveField(11)
  bool? isFirstTime;
  @HiveField(12)
  bool? isVerified;

  VotingappUser({
    required this.fullName,
    required this.email,
    this.electionLocalGovernment,
    this.electionPollingUnits,
    this.electionState,
    this.electionWard,
    this.isAmputee,
    this.gender,
    this.isFirstTime,
    this.isVerified,
    this.phoneNumber,
    this.nin,
    this.profileImageUrl,
  });

  factory VotingappUser.fromSigninResponse({required Voter user}) {
    return VotingappUser(
      fullName: user.fullName,
      email: user.email,
      isAmputee: user.isAmputee,
      electionLocalGovernment: user.electionLocalGovernment,
      electionPollingUnits: user.electionPollingUnits,
      electionState: user.electionState,
      electionWard: user.electionWard,
      gender: user.gender,
      isFirstTime: user.isFirstTime,
      isVerified: user.isVerified,
      phoneNumber: user.phoneNumber,
      nin: user.nin,
      profileImageUrl: user.profileImageUrl,
    );
  }
}
