import 'package:json_annotation/json_annotation.dart';

part 'voter.g.dart';

@JsonSerializable()
class Voter {
  String? email,
      fullName,
      nin,
      phoneNumber,
      profileImageUrl,
      electionState,
      electionLocalGovernment,
      electionWard,
      gender,
      dateOfBirth,
      electionPollingUnits;
  bool? isAmputee,
      isVerified,
      isFirstTime,
      hasVotedPresidential,
      hasVotedGubernatorial,
      hasVotedLocalGovernment;

  Voter({
    required this.email,
    required this.fullName,
    required this.nin,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.profileImageUrl,
    required this.electionState,
    required this.electionLocalGovernment,
    required this.electionWard,
    required this.electionPollingUnits,
    required this.gender,
    required this.isAmputee,
    required this.isFirstTime,
    required this.isVerified,
    this.hasVotedGubernatorial = false,
    this.hasVotedLocalGovernment = false,
    this.hasVotedPresidential = false,
  });

  factory Voter.fromJson(Map<String, dynamic> json) => _$VoterFromJson(json);

  Map<String, dynamic> toJson() => _$VoterToJson(this);
}
