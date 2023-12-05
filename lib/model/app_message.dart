/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

AppMessage appMessageFromJson(String str) =>
    AppMessage.fromJson(json.decode(str));

String appMessageToJson(AppMessage data) => json.encode(data.toJson());

class AppMessage {
  AppMessage({
    required this.parentText1,
  });

  String? parentText1;

  factory AppMessage.fromJson(Map<dynamic, dynamic> json) => AppMessage(
        parentText1: json["parent_text_1"],
      );

  Map<dynamic, dynamic> toJson() => {
        "parent_text_1": parentText1,
      };
}
