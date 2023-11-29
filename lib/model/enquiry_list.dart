/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

EnquiryList enquiryListFromJson(String str) =>
    EnquiryList.fromJson(json.decode(str));

String enquiryListToJson(EnquiryList data) => json.encode(data.toJson());

class EnquiryList {
  EnquiryList({
    required this.d,
    required this.data,
    required this.message,
    required this.status,
  });

  D d;
  List<Datum> data;
  String message;
  bool status;

  factory EnquiryList.fromJson(Map<dynamic, dynamic> json) => EnquiryList(
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
    required this.parentName,
    required this.parentUserId,
    required this.subject,
    required this.parentPhoneNumber,
    required this.description,
    required this.createdAt,
    required this.type,
    required this.teacherPrefarence,
    required this.userId,
    required this.id,
    required this.datumClass,
    required this.parentLocation,
    required this.board,
  });

  String parentName;
  int parentUserId;
  String subject;
  String parentPhoneNumber;
  String description;
  DateTime createdAt;
  int type;
  String teacherPrefarence;
  int userId;
  int id;
  String datumClass;
  String parentLocation;
  String board;

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        parentName: json["parent_name"],
        parentUserId: json["parent_user_id"],
        subject: json["subject"],
        parentPhoneNumber: json["parent_phone_number"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        type: json["type"],
        teacherPrefarence: json["teacher_prefarence"],
        userId: json["user_id"],
        id: json["id"],
        datumClass: json["class"],
        parentLocation: json["parent_location"],
        board: json["board"],
      );

  Map<dynamic, dynamic> toJson() => {
        "parent_name": parentName,
        "parent_user_id": parentUserId,
        "subject": subject,
        "parent_phone_number": parentPhoneNumber,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "type": type,
        "teacher_prefarence": teacherPrefarence,
        "user_id": userId,
        "id": id,
        "class": datumClass,
        "parent_location": parentLocation,
        "board": board,
      };
}
