/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

StudentList studentListFromJson(String str) =>
    StudentList.fromJson(json.decode(str));

String studentListToJson(StudentList data) => json.encode(data.toJson());

class StudentList {
  StudentList({
    required this.d,
    required this.data,
    required this.message,
    required this.status,
  });

  D d;
  List<Datum> data;
  String message;
  bool status;

  factory StudentList.fromJson(Map<dynamic, dynamic> json) => StudentList(
        d: D.fromJson(json["d"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "d": d.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class D {
  D();

  factory D.fromJson(Map<dynamic, dynamic> json) => D();

  Map<dynamic, dynamic> toJson() => {};
}

class Datum {
  Datum({
    required this.phoneNo,
    this.extraParm5,
    required this.latitude,
    this.extraParm4,
    this.createdAt,
    required this.secondaryStatus,
    required this.roleText,
    required this.password,
    required this.roleId,
    this.extraParm3,
    required this.primaryStatus,
    this.extraParm2,
    this.extraParm1,
    required this.id,
    required this.phoneNoCountryCode,
    required this.longitude,
    required this.parentUserId,
    this.userImage,
    required this.relationId,
    this.extraUpload2,
    this.extraUpload1,
    required this.socialId,
    this.name,
    this.location,
    this.extraParm6,
    this.extraParm7,
  });

  String phoneNo;
  String? extraParm5;
  String latitude;
  String? extraParm4;
  DateTime? createdAt;
  int secondaryStatus;
  RoleText roleText;
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
  int relationId;
  String? extraUpload2;
  String? extraUpload1;
  int socialId;
  String? name;
  String? location;
  String? extraParm6;
  String? extraParm7;

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        phoneNo: json["phone_no"],
        extraParm5: json["extra_parm_5"],
        latitude: json["latitude"],
        extraParm4: json["extra_parm_4"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        secondaryStatus: json["secondary_status"],
        roleText: roleTextValues.map[json["role_text"]]!,
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
        relationId: json["relation_id"],
        extraUpload2: json["extra_upload_2"],
        extraUpload1: json["extra_upload_1"],
        socialId: json["social_id"],
        name: json["name"],
        location: json["location"],
        extraParm6: json["extra_parm_6"],
        extraParm7: json["extra_parm_7"],
      );

  Map<dynamic, dynamic> toJson() => {
        "phone_no": phoneNo,
        "extra_parm_5": extraParm5,
        "latitude": latitude,
        "extra_parm_4": extraParm4,
        "created_at": createdAt?.toIso8601String(),
        "secondary_status": secondaryStatus,
        "role_text": roleTextValues.reverse[roleText],
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
        "relation_id": relationId,
        "extra_upload_2": extraUpload2,
        "extra_upload_1": extraUpload1,
        "social_id": socialId,
        "name": name,
        "location": location,
        "extra_parm_6": extraParm6,
        "extra_parm_7": extraParm7,
      };
}

enum RoleText { PARENT }

final roleTextValues = EnumValues({"Parent": RoleText.PARENT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
