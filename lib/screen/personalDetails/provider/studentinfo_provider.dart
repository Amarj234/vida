import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../commonfun/get_location.dart';
import '../../../config/baseUrl.dart';
import '../../../model/getlocation_model.dart';

class StudentinfoProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController mobile = TextEditingController();
  int? gender;
  bool isLoading = false;
  bool success = false;

  getAddress() async {
    LocationModel? data = await GetLocation().getLatLong();
    print("mylocation234 ${data}");
    if (data != null) {
      location.text = data.locationname;
    }
  }

  register(String id, String otp) async {
    isLoading = true;

    final url = Uri.parse("${baseUrl}register");

    print(url);
    try {
      final response = await http.post(url, body: {
        "name": name.text,
        "email": location.text,
        "gender": landmark.text.toUpperCase(),
        "dob": classs.text,
        "id": subject.text,
        "idf": mobile.text,
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
