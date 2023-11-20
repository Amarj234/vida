import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../config/baseUrl.dart';

class TeacherEnquiryProvider extends ChangeNotifier {
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController massege = TextEditingController();
  int? gender;
  List gen = ["Male", "Female", "Other"];
  final dropdownState = GlobalKey<FormFieldState>();
  bool isLoading = false;
  bool success = false;
  savaEnquiry() async {
    isLoading = true;

    final url = Uri.parse("${baseUrl}register");

    print(url);
    try {
      final response = await http.post(url, body: {
        "name": massege.text,
        "dob": classs.text,
        "id": subject.text,
        "s": gender,
      });

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        // LoginResponse loginResponse = await getToken(otp, mobile);
        // print(" print tocken ${loginResponse.apiTokenPlainText}  $otp $mobile");
        // if (loginResponse.status!) {
        //   //  Get.offAllNamed(NavigationMount.route);
        //
        //   prefs.setToken(loginResponse.apiTokenPlainText!);
        //   prefs.setData("login", "yes");
        //   Get.to(ReasonOptions());
        //   // prefs.saveRegStatus();
        //
        //   print("Token: ${loginResponse.apiTokenPlainText}");
        // } else {
        //   Get.snackbar("Error", loginResponse.message!);
        // }

        isLoading = false;
        success = true;
        print(json);
      }
    } catch (e) {
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
  }
}
