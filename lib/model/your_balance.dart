/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

YourBalance yourBalanceFromJson(String str) =>
    YourBalance.fromJson(json.decode(str));

String yourBalanceToJson(YourBalance data) => json.encode(data.toJson());

class YourBalance {
  YourBalance({
    required this.d,
    required this.message,
    required this.status,
  });

  D d;
  String message;
  bool status;

  factory YourBalance.fromJson(Map<dynamic, dynamic> json) => YourBalance(
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
    required this.numberOfView,
  });

  int numberOfView;

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        numberOfView: json["number_of_view"],
      );

  Map<dynamic, dynamic> toJson() => {
        "number_of_view": numberOfView,
      };
}
