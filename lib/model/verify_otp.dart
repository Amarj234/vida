/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

VerifyOtp verifyOtpFromJson(String str) => VerifyOtp.fromJson(json.decode(str));

String verifyOtpToJson(VerifyOtp data) => json.encode(data.toJson());

class VerifyOtp {
  VerifyOtp({
    required this.d,
    required this.message,
    required this.status,
  });

  D d;
  String message;
  bool status;

  factory VerifyOtp.fromJson(Map<dynamic, dynamic> json) => VerifyOtp(
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
    required this.id,
    required this.rid,
    required this.code,
  });

  int id;
  int rid;
  int code;

  factory D.fromJson(Map<dynamic, dynamic> json) => D(
        id: json["id"],
        rid: json["rid"],
        code: json["code"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "rid": rid,
        "code": code,
      };
}
