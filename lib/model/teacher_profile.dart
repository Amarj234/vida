/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:convert';

TeacherProfile teacherProfileFromJson(String str) =>
    TeacherProfile.fromJson(json.decode(str));

String teacherProfileToJson(TeacherProfile data) => json.encode(data.toJson());

class TeacherProfile {
  TeacherProfile({
    required this.d,
    required this.message,
    required this.status,
  });

  D d;
  String message;
  bool status;

  factory TeacherProfile.fromJson(Map<dynamic, dynamic> json) => TeacherProfile(
        d: D.fromJson(json["d"]),
        message: json["message"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "d": d.toJson(),
        "message": message,
        "status": status,
      };
}

class D {
  D({
    required this.data,
  });

  Data data;

  factory D.fromJson(Map<dynamic, dynamic> json) => D(
        data: Data.fromJson(json["data"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.phoneNo,
    required this.extraParm6,
    required this.extraParm5,
    required this.latitude,
    required this.extraParm4,
    required this.secondaryStatus,
    required this.roleText,
    required this.password,
    required this.roleId,
    required this.extraParm3,
    required this.primaryStatus,
    required this.extraParm2,
    required this.extraParm1,
    required this.id,
    required this.phoneNoCountryCode,
    required this.longitude,
    required this.parentUserId,
    this.userImage,
    required this.extra_upload_1,
    this.extra_upload_2,
    this.extra_upload_3,
    required this.relationId,
    required this.socialId,
    required this.dob,
    required this.name,
    required this.location,
  });

  String phoneNo;
  String? extraParm6;
  String? extraParm5;
  String latitude;
  String? extraParm4;
  int secondaryStatus;
  String roleText;
  String password;
  int roleId;
  String? extraParm3;
  int primaryStatus;
  String? extraParm2;
  String? extraParm1;
  int id;
  String phoneNoCountryCode;
  String longitude;
  int parentUserId;
  String? userImage;
  // ignore: non_constant_identifier_names
  String? extra_upload_1;
  String? extra_upload_2;
  String? extra_upload_3;
  int relationId;
  int socialId;
  DateTime? dob;
  String name;
  String location;

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        phoneNo: json["phone_no"],
        extraParm6: json["extra_parm_6"],
        extraParm5: json["extra_parm_5"],
        latitude: json["latitude"],
        extraParm4: json["extra_parm_4"],
        secondaryStatus: json["secondary_status"],
        roleText: json["role_text"],
        password: json["password"],
        roleId: json["role_id"],
        extraParm3: json["extra_parm_3"],
        primaryStatus: json["primary_status"],
        extraParm2: json["extra_parm_2"],
        extraParm1: json["extra_parm_1"],
        id: json["id"],
        phoneNoCountryCode: json["phone_no_country_code"],
        longitude: json["longitude"],
        parentUserId: json["parent_user_id"],
        userImage: json["user_image"],
        extra_upload_1: json["extra_upload_1"],
        extra_upload_2: json["extra_upload_2"],
        extra_upload_3: json["extra_upload_3"],
        relationId: json["relation_id"],
        socialId: json["social_id"],
        dob: DateTime.parse(json["dob"]),
        name: json["name"],
        location: json["location"],
      );

  Map<dynamic, dynamic> toJson() => {
        "phone_no": phoneNo,
        "extra_parm_6": extraParm6,
        "extra_parm_5": extraParm5,
        "latitude": latitude,
        "extra_parm_4": extraParm4,
        "secondary_status": secondaryStatus,
        "role_text": roleText,
        "password": password,
        "role_id": roleId,
        "extra_parm_3": extraParm3,
        "primary_status": primaryStatus,
        "extra_parm_2": extraParm2,
        "extra_parm_1": extraParm1,
        "id": id,
        "phone_no_country_code": phoneNoCountryCode,
        "longitude": longitude,
        "parent_user_id": parentUserId,
        "user_image": userImage,
        "extra_upload_1": extra_upload_1,
        "extra_upload_2": extra_upload_2,
        "extra_upload_3": extra_upload_3,
        "relation_id": relationId,
        "social_id": socialId,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "name": name,
        "location": location,
      };
}
