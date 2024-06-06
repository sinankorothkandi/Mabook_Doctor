import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
   String? email;

  @HiveField(1)
   String? name;

  @HiveField(2)
   String? professionalBio;

  @HiveField(3)
   Map? consultingTimes;

  @HiveField(4)
   String? department;

  @HiveField(5)
   String? dob;

  @HiveField(6)
   String? education;

  @HiveField(7)
   int? experience;

  @HiveField(8)
   String? gender;

  @HiveField(9)
   int? imrRegisterNo;

  @HiveField(10)
   String? joiningDate;

  @HiveField(11)
   int? phoneNumber;

  @HiveField(12)
   String? profile;

  @HiveField(13)
   String? specializeIn;

  @HiveField(14)
   String? stateMedicalCouncil;

  @HiveField(15)
   String? doctorId;

  @HiveField(16)
   int? consultancyFees;
}
