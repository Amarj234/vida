// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../config/baseUrl.dart';

class AppmessageProvider extends ChangeNotifier {
  String? appMessage;
  bool isLoading = true;

  getlist(BuildContext context) async {
    final url = Uri.parse("${baseUrl}get-app-message");
    //  try {
    final request = http.Request(
      'GET',
      url,
    );
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      appMessage = json[0]['parent_text_1'];
      isLoading = false;
      notifyListeners();
    }
    // } catch (e) {
    //   print("$e");
    //   //Get.snackbar('Error', 'An error occurred');
    // } finally {
    //   isLoading = false;
    // }
  }
}
