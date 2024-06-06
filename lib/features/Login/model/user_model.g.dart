// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel()
      ..email = fields[0] as String
      ..name = fields[1] as String
      ..professionalBio = fields[2] as String
      ..consultingTimes = (fields[3] as Map).cast<dynamic, dynamic>()
      ..department = fields[4] as String
      ..dob = fields[5] as String
      ..education = fields[6] as String
      ..experience = fields[7] as int
      ..gender = fields[8] as String
      ..imrRegisterNo = fields[9] as int
      ..joiningDate = fields[10] as String
      ..phoneNumber = fields[11] as int
      ..profile = fields[12] as String
      ..specializeIn = fields[13] as String
      ..stateMedicalCouncil = fields[14] as String
      ..doctorId = fields[15] as String
      ..consultancyFees = fields[16] as int;
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.professionalBio)
      ..writeByte(3)
      ..write(obj.consultingTimes)
      ..writeByte(4)
      ..write(obj.department)
      ..writeByte(5)
      ..write(obj.dob)
      ..writeByte(6)
      ..write(obj.education)
      ..writeByte(7)
      ..write(obj.experience)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.imrRegisterNo)
      ..writeByte(10)
      ..write(obj.joiningDate)
      ..writeByte(11)
      ..write(obj.phoneNumber)
      ..writeByte(12)
      ..write(obj.profile)
      ..writeByte(13)
      ..write(obj.specializeIn)
      ..writeByte(14)
      ..write(obj.stateMedicalCouncil)
      ..writeByte(15)
      ..write(obj.doctorId)
      ..writeByte(16)
      ..write(obj.consultancyFees);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
