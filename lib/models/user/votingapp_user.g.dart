// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'votingapp_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VotingappUserAdapter extends TypeAdapter<VotingappUser> {
  @override
  final int typeId = 1;

  @override
  VotingappUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VotingappUser(
      fullName: fields[0] as String?,
      email: fields[1] as String?,
      electionLocalGovernment: fields[6] as String?,
      electionPollingUnits: fields[8] as String?,
      electionState: fields[5] as String?,
      electionWard: fields[7] as String?,
      isAmputee: fields[10] as bool?,
      gender: fields[9] as String?,
      isFirstTime: fields[11] as bool?,
      isVerified: fields[12] as bool?,
      phoneNumber: fields[3] as String?,
      nin: fields[2] as String?,
      profileImageUrl: fields[4] as String?,
      dateOfBirth: fields[13] as String?,
      hasVotedGubernatorial: fields[15] as bool?,
      hasVotedLocalGovernment: fields[16] as bool?,
      hasVotedPresidential: fields[14] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, VotingappUser obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.nin)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.profileImageUrl)
      ..writeByte(5)
      ..write(obj.electionState)
      ..writeByte(6)
      ..write(obj.electionLocalGovernment)
      ..writeByte(7)
      ..write(obj.electionWard)
      ..writeByte(8)
      ..write(obj.electionPollingUnits)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.isAmputee)
      ..writeByte(11)
      ..write(obj.isFirstTime)
      ..writeByte(12)
      ..write(obj.isVerified)
      ..writeByte(13)
      ..write(obj.dateOfBirth)
      ..writeByte(14)
      ..write(obj.hasVotedPresidential)
      ..writeByte(15)
      ..write(obj.hasVotedGubernatorial)
      ..writeByte(16)
      ..write(obj.hasVotedLocalGovernment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VotingappUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
