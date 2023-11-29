/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

DropdownData dropdownDataFromJson(String str) =>
    DropdownData.fromJson(json.decode(str));

String dropdownDataToJson(DropdownData data) => json.encode(data.toJson());

class DropdownData {
  DropdownData({
    required this.d,
    required this.data,
    required this.message,
    required this.status,
  });

  D d;
  List<Datum> data;
  String message;
  bool status;

  factory DropdownData.fromJson(Map<dynamic, dynamic> json) => DropdownData(
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
    required this.updatedAt,
    required this.userId,
    required this.propsTitle,
    required this.createdAt,
    required this.id,
    required this.propsType,
  });

  DateTime updatedAt;
  int userId;
  String propsTitle;
  DateTime createdAt;
  int id;
  int propsType;

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        propsTitle: json["props_title"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        propsType: json["props_type"],
      );

  Map<dynamic, dynamic> toJson() => {
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "props_title": propsTitle,
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "props_type": propsType,
      };
}
