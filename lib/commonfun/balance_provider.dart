import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../config/baseUrl.dart';
import '../config/sharedPrefs.dart';
import '../model/dropdown_data.dart';

class BalanceProvider extends ChangeNotifier {
  Future<DropdownData?> getdata(int id) async {
    final prefs = UserPrefs();
    var id = prefs.getData("id");

    var token = prefs.getData("token");
    final url = Uri.parse("${baseUrl}props/get-all-props-by-type/");
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
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
    return null;
  }
}
