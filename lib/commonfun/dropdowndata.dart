import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/baseUrl.dart';
import '../config/sharedPrefs.dart';
import '../model/dropdown_data.dart';

class DropdownDatas {
  Future<DropdownData?> getdata(int id) async {
    final url = Uri.parse("${baseUrl}props/get-all-props-by-type/");
    Map<String, String> headers = {
      //"Authorization": "Bearer $token",
      "Content-type": "application/json"
    };

    Map data = {"type": id};
    final response =
        await http.post(url, headers: headers, body: jsonEncode(data));
    final json = jsonDecode(response.body);

    DropdownData res = DropdownData.fromJson(json);
    if (res.status == true) {
      return res;
    }
  }
}
