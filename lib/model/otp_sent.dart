/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

OtpSent otpSentFromJson(String str) => OtpSent.fromJson(json.decode(str));

String otpSentToJson(OtpSent data) => json.encode(data.toJson());

class OtpSent {
  OtpSent({
    required this.d,
    required this.message,
    required this.status,
  });

  D d;
  String message;
  bool status;

  factory OtpSent.fromJson(Map<dynamic, dynamic> json) => OtpSent(
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
    required this.otp,
    required this.step,
  });

  String otp;
  int step;

  factory D.fromJson(Map<dynamic, dynamic> json) => D(
        otp: json["otp"],
        step: json["step"],
      );

  Map<dynamic, dynamic> toJson() => {
        "otp": otp,
        "step": step,
      };
}
