// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';

import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vida/commonfun/tab_provider.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/otp_sent.dart';
import '../../../model/register_res.dart';
import '../../../model/verify_otp.dart';
import '../../commonWidget/costum_snackbar.dart';
import '../../home_screen.dart';
import '../../selectlocation/provider/tabprovider.dart';
import '../../selectlocation/select_location.dart';
import '../otp_screen.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  final otpController = TextEditingController();
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
    isLoading = true;
    //final fcmToken = "fghjjkl;';";
    final fcmToken = await FirebaseMessaging.instance.getToken();

    final url = Uri.parse("${baseUrl}otp");

    final prot = Provider.of<HometabProvider>(context, listen: false);

    startTimer();
    try {
      final response = await http.post(url, body: {
        "phone_number": mobile,
        "type": prot.uid.toString(),
        "ntoken": fcmToken,
        "longitude": '1',
        "latitude": '1',
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        // print(json);

        OtpSent authReponse = OtpSent.fromJson(json);
        //
        if (authReponse.status) {
          stopTimer();
          //

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(
                        mobile: mobile,
                        otp: authReponse.d.otp,
                        uid: prot.uid,
                      )));

          isLoading = false;
          startTimer();
        }
      }
    } catch (e) {
      // Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  void resendCode(BuildContext context, String mobile) async {
    isLoading = true;
    //final fcmToken = "fghjjkl;';";
    final fcmToken = await FirebaseMessaging.instance.getToken();

    final url = Uri.parse("${baseUrl}otp");

    final prot = Provider.of<HometabProvider>(context, listen: false);
    final tab = Provider.of<TabProvider>(context, listen: false);
    startTimer();
    try {
      final response = await http.post(url, body: {
        "phone_number": mobile,
        "type": prot.uid.toString(),
        "ntoken": fcmToken,
        "list": tab.tabval.join(","),
        "longitude": '1',
        "latitude": '1',
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        // print(json);

        OtpSent authReponse = OtpSent.fromJson(json);
        //
        if (authReponse.status) {
          stopTimer();
          //
          otpController.text = authReponse.d.otp.toString();
          isLoading = false;
          startTimer();
        }
      }
    } catch (e) {
      // Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  void verifyCode(
      String otp, String mobile, int uid, BuildContext context) async {
    isLoading = true;
    final prefs = UserPrefs();
    final url = Uri.parse("${baseUrl}otp-varification");
    final response =
        await http.post(url, body: {"phone_number": mobile, "otp": otp});
    if (kDebugMode) {
      print("url:- $url");
      print("status code:- ${response.statusCode}");
      log("responce:- ${response.body}");
    }
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['d']['code'] == 1) {
        VerifyOtp otpResponse = VerifyOtp.fromJson(json);

        if (otpResponse.status) {
          //  responce:- {"status":true,"d":{"id":3,"rid":1,"tid":0},"message":"otp is correct"}
          prefs.setData("id", otpResponse.d.id.toString());

          if (uid == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SelectLocation(
                          rid: otpResponse.d.id,
                          mobile: mobile,
                          uid: uid,
                        )));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SelectLocation(
                          rid: otpResponse.d.id,
                          mobile: mobile,
                          uid: uid,
                        )));
          }
        } else {}
      } else {
        RegisterRes res = RegisterRes.fromJson(json);
        if (res.status = true) {
          final prot = Provider.of<HometabProvider>(context, listen: false);
          prot.changeUid(res.d.data.roleId);
          prefs.setData("mobile", res.d.data.phoneNo.toString());
          prefs.setData("rid", res.d.data.roleId.toString());
          prefs.setData("id", res.d.data.id.toString());
          prefs.setData("name", res.d.data.name);
          prefs.setData("token", res.d.token);
          prefs.setData("login", "yes");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          CostomSnackbar.show(context, res.message);
        }
      }
      isLoading = false;
      // prefs.saveRegStatus();

      //   print("Token: ${loginResponse.apiTokenPlainText}");

      //   print(responseCode);
    } else {
      //   Get.snackbar("Login Failed", otpResponse.message!);
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
