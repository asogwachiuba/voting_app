// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voter _$VoterFromJson(Map<String, dynamic> json) => Voter(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      nin: json['nin'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      electionState: json['electionState'] as String?,
      electionLocalGovernment: json['electionLocalGovernment'] as String?,
      electionWard: json['electionWard'] as String?,
      electionPollingUnits: json['electionPollingUnits'] as String?,
      gender: json['gender'] as String?,
      isAmputee: json['isAmputee'] as bool?,
      isFirstTime: json['isFirstTime'] as bool?,
      isVerified: json['isVerified'] as bool?,
      hasVotedGubernatorial: json['hasVotedGubernatorial'] as bool? ?? false,
      hasVotedLocalGovernment:
          json['hasVotedLocalGovernment'] as bool? ?? false,
      hasVotedPresidential: json['hasVotedPresidential'] as bool? ?? false,
    );

Map<String, dynamic> _$VoterToJson(Voter instance) => <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'nin': instance.nin,
      'phoneNumber': instance.phoneNumber,
      'profileImageUrl': instance.profileImageUrl,
      'electionState': instance.electionState,
      'electionLocalGovernment': instance.electionLocalGovernment,
      'electionWard': instance.electionWard,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'electionPollingUnits': instance.electionPollingUnits,
      'isAmputee': instance.isAmputee,
      'isVerified': instance.isVerified,
      'isFirstTime': instance.isFirstTime,
      'hasVotedPresidential': instance.hasVotedPresidential,
      'hasVotedGubernatorial': instance.hasVotedGubernatorial,
      'hasVotedLocalGovernment': instance.hasVotedLocalGovernment,
    };
