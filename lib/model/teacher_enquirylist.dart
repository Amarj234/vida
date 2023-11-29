/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

TeacherEnquirylist teacherEnquirylistFromJson(String str) =>
    TeacherEnquirylist.fromJson(json.decode(str));

String teacherEnquirylistToJson(TeacherEnquirylist data) =>
    json.encode(data.toJson());

class TeacherEnquirylist {
  TeacherEnquirylist({
    required this.d,
    required this.data,
    required this.message,
    required this.status,
  });

  D d;
  List<Datum> data;
  String message;
  bool status;

  factory TeacherEnquirylist.fromJson(Map<dynamic, dynamic> json) =>
      TeacherEnquirylist(
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
    required this.teacherPrefarence,
    required this.userId,
    required this.subject,
    required this.description,
    required this.createdAt,
    required this.id,
    required this.type,
    required this.datumClass,
    required this.board,
  });

  String teacherPrefarence;
  int userId;
  String subject;
  String description;
  DateTime createdAt;
  int id;
  int type;
  String datumClass;
  String board;

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        teacherPrefarence: json["teacher_prefarence"],
        userId: json["user_id"],
        subject: json["subject"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        type: json["type"],
        datumClass: json["class"],
        board: json["board"],
      );

  Map<dynamic, dynamic> toJson() => {
        "teacher_prefarence": teacherPrefarence,
        "user_id": userId,
        "subject": subject,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "type": type,
        "class": datumClass,
        "board": board,
      };
}
