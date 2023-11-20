import 'dart:async';

import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vida/commonfun/tab_provider.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../otp_screen.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  final token = UserPrefs().getToken();

  bool success = false;
  String otp = '';
  String error = '';
  int? userId = 0;
  int seconds = 45;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds <= 0) {
        timer?.cancel();
        // Timer completed, perform additional actions here
      } else {
        seconds--;
      }
      notifyListeners();
    });
  }

  void stopTimer() {
    timer?.cancel();
    seconds = 45;
    notifyListeners();
  }

  void sendCode(BuildContext context, String mobile) async {
    UserPrefs prefs = UserPrefs();
    isLoading = true;
    //final fcmToken = "fghjjkl;';";
    final fcmToken = await FirebaseMessaging.instance.getToken();
    prefs.saveFCMToken(fcmToken!);

    final url =
        Uri.parse("${baseUrl}loging-otp-or-register?mobile_number=$mobile&device=$fcmToken");

    print(url);
    final pro = Provider.of<HometabProvider>(context, listen: false);
    startTimer();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpScreen(
                  mobile: mobile,
                  id: '55',
                  uid: pro.uid,
                )));
    try {
      // final response = await http.post(url);
      // final pro = Provider.of<HometabProvider>(context, listen: false);
      // if (response.statusCode == 200) {
      //   final json = jsonDecode(response.body);
      //   // print(json);
      //
      //   // AuthReponse authReponse = AuthReponse.fromJson(json);
      //   //
      //   // if (authReponse.status!) {
      //   stopTimer();
      //   //   //
      //   //   Get.to(OtpScreen(
      //   //     mobile: mobile,
      //   //     id: authReponse.responseData!.userId.toString(),
      //   //   ));
      //   //
      //   //   final id = authReponse.responseData!.userId;
      //   //   userId = id!;
      //   //   otp.value = authReponse.responseData!.otp!;
      //   //   print(userId);
      //   //
      //   startTimer();
      //   // }
      // }
    } catch (e) {
      // Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
  }

  void resendCode(String mobile) async {
    UserPrefs prefs = UserPrefs();
    isLoading = true;
    final fcmToken = await FirebaseMessaging.instance.getToken();
    prefs.saveFCMToken(fcmToken!);
    stopTimer();
    startTimer();
    // final url =
    //     Uri.parse("${baseUrl}loging-otp-or-register?mobile_number=$mobile&device=$fcmToken");
    //
    // final response = await http.post(url);
    // print(response.body);
    //
    // if (response.statusCode == 200) {
    //   final json = jsonDecode(response.body);
    //   // AuthReponse authReponse = AuthReponse.fromJson(json);
    //   // if (authReponse.status!) {
    //   //   stopTimer();
    //   //   startTimer();
    //   //   otp.value = authReponse.responseData!.otp!;
    //   // }
    // }
    isLoading = false;
  }

  void verifyCode(String otp, String mobile) async {
    isLoading = true;

    final url = Uri.parse("${baseUrl}opt-varifiaction?otp=$otp&user_id=$userId");

    final response = await http.post(url);
    if (kDebugMode) {
      print("url:- $url");
      print("status code:- ${response.statusCode}");
      log("responce:- ${response.body}");
    }
    if (response.statusCode == 200) {
      //final json = jsonDecode(response.body);
      // OtpResponse otpResponse = OtpResponse.fromJson(json);
      //
      // if (otpResponse.status ?? false) {
      //   final responseCode = otpResponse.code;
      //   if (responseCode == 2) {
      //     LoginResponse loginResponse = await getToken(otp, mobile);
      //     print(" print tocken ${loginResponse.apiTokenPlainText}  $otp $mobile");
      //     if (loginResponse.status!) {
      //       //  Get.offAllNamed(NavigationMount.route);
      //       print("currenttoken ${loginResponse.apiTokenPlainText}");
      //       prefs.setToken(loginResponse.apiTokenPlainText!);
      //       prefs.setData("login", "yes");
      //       prefs.setData("name", loginResponse.responseData!.name.toString());
      //       prefs.setData("profile", loginResponse.responseData!.image.toString());
      //       prefs.setData("mobile", mobile);
      //       print("updateans  ${prefs.getData('updateans')}");
      //       Future.delayed(const Duration(milliseconds: 50), () {
      //         if (prefs.getData("updateans") == "yes") {
      //           Get.off(const HomeScreen());
      //         } else {
      //           Get.off(const ReasonOptions());
      //         }
      //       });
      //       // prefs.saveRegStatus();
      //
      //       print("Token: ${loginResponse.apiTokenPlainText}");
      //     } else {
      //       Get.snackbar("Error", loginResponse.message!);
      //     }
      //   } else {
      //     Get.to(PersonalDetails(
      //       id: userId.toString(),
      //       otp: otp.toString(),
      //       mobile: mobile.toString(),
      //     ));
      //     //  Get.offAllNamed(VerifyAdhaar.route);
      //   }
      //   print(responseCode);
      // } else {
      //   Get.snackbar("Login Failed", otpResponse.message!);
      // }
    }
    isLoading = false;
  }

  // Future<LoginResponse> getToken(String otp, String mobile) async {
  //   final url = Uri.parse("${baseUrl}login?password=$otp&mobile_number=$mobile");
  //   final response = await http.post(url);
  //   LoginResponse otpResponse = LoginResponse();
  //
  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     if (json['response_data_two'] != 0) {
  //       UserPrefs().setData("updateans", "yes");
  //     }
  //
  //     otpResponse = LoginResponse.fromJson(json);
  //
  //     print("logres  $json");
  //     return otpResponse;
  //   }
  //   return otpResponse;
  // }
}
