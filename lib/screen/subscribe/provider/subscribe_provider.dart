import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/payment_history.dart';
import '../../../model/your_balance.dart';
import '../../commonWidget/costum_snackbar.dart';
import '../../paymentsuccess/payment_success.dart';

class SubscribeProvider extends ChangeNotifier {
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController massege = TextEditingController();
  TextEditingController board = TextEditingController();
  int? gender;

  final dropdownState = GlobalKey<FormFieldState>();
  final dropdownState2 = GlobalKey<FormFieldState>();
  final dropdownState3 = GlobalKey<FormFieldState>();
  bool isLoading = false;
  bool success = false;
  payAmount(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final prefs = UserPrefs();
    var token = prefs.getData("token");
    Map<String, String> headers = {
      "x-access-token": "$token",
      "Content-type": "application/json"
    };
    final url = Uri.parse("${baseUrl}pay/make-payment");
    Map data = {
      "qty": 4,
    };
    try {
      final response =
          await http.post(url, body: json.encode(data), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['status'] == true) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const PaymentSuccess()));
        } else {
          CostomSnackbar.show(context, json['message']);
        }

        isLoading = false;
        success = true;
      }
    } catch (e) {
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  PaymentHistory? paymentHistory;

  String formateDate(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd-MM-yyyy');
    // var outputFormat2 = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  YourBalance? yourBalance;
  getBalance(BuildContext context) async {
    final prefs = UserPrefs();
    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
    };
    final url = Uri.parse("${baseUrl}user/get-user-balance");

    try {
      final response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        YourBalance res = YourBalance.fromJson(json);
        yourBalance = res;
      }
    } catch (e) {
      print("$e");

      CostomSnackbar.show(context, "$e");
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  getlist(BuildContext context) async {
    isLoading = true;
    final prefs = UserPrefs();
    var token = prefs.getData("token");
    Map<String, String> headers = {
      "x-access-token": "$token",
    };
    final url = Uri.parse("${baseUrl}pay/get-payment-list");

    try {
      final response = await http.post(url, headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        PaymentHistory res = PaymentHistory.fromJson(json);
        paymentHistory = res;
        // if (loginResponse.status!) {
        // } else {
        //   CostomSnackbar.show(context, "ahow");
        // }

        isLoading = false;
        success = true;
      }
    } catch (e) {
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }
}
