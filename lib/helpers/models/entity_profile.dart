import 'package:hive_flutter/adapters.dart';

part 'entity_profile.g.dart';

@HiveType(typeId: 1)
class EntityProfile extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String uuid;

  @HiveField(2)
  String email;

  @HiveField(3)
  String fullname;

  @HiveField(4)
  String? username;

  @HiveField(5)
  bool? isVerifiedAccount;

  @HiveField(6)
  bool? linkedWithGoogle;

  @HiveField(7)
  String? googleEmail;

  // BASIC INFORMATION
  @HiveField(8)
  String? passportNo;

  @HiveField(9)
  String? residentNo;

  @HiveField(10)
  String? phone;

  @HiveField(11)
  String? photo;

  @HiveField(12)
  String? userType;

  EntityProfile({
    required this.id,
    required this.uuid,
    required this.email,
    required this.fullname,
    this.username,
    this.isVerifiedAccount,
    this.linkedWithGoogle,
    this.googleEmail,
    this.passportNo,
    this.residentNo,
    this.phone,
    this.photo,
    this.userType,
  });

  factory EntityProfile.fromJson(Map<String, dynamic> json) => EntityProfile(
        id: json["id"],
        uuid: json["uuid"],
        email: json["email"],
        fullname: json["fullname"],
        username: json["username"],
        isVerifiedAccount: json["isVerifiedAccount"],
        linkedWithGoogle: json["linkedWithGoogle"],
        googleEmail: json["googleEmail"],
        passportNo: json["passportNo"],
        residentNo: json["residentNo"],
        phone: json["phone"],
        photo: json["photo"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "email": email,
        "fullname": fullname,
        "username": username,
        "isVerifiedAccount": isVerifiedAccount,
        "linkedWithGoogle": linkedWithGoogle,
        "googleEmail": googleEmail,
        "passportNo": passportNo,
        "residentNo": residentNo,
        "phone": phone,
        "photo": photo,
        "userType": userType,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
