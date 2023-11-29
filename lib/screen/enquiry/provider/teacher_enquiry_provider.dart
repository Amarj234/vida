import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../commonfun/dropdowndata.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/dropdown_data.dart';
import '../../../model/teacher_enquirylist.dart';
import '../../commonWidget/costum_snackbar.dart';
import '../../home_screen.dart';

class TeacherEnquiryProvider extends ChangeNotifier {
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
  savaEnquiry(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final prefs = UserPrefs();
    var id = prefs.getData("id");

    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
      // "Content-type": "application/json"
    };
    final url = Uri.parse("${baseUrl}enquiry/create-enquiry");

    print(url);
    try {
      final response = await http.post(url,
          body: {
            "userID": id,
            "board": board.text,
            "class": classs.text,
            "teacherPrefarence": gender == 0
                ? "M"
                : gender == 1
                    ? "F"
                    : "ANY",
            "subject": subject.text,
            "description": massege.text
          },
          headers: headers);

      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['status'] == true) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomeScreen(
                        index: 1,
                      )));
        } else {
          CostomSnackbar.show(context, json['message']);
        }

        isLoading = false;
        success = true;
        print(json);
      }
    } catch (e) {
      print("$e");
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  TeacherEnquirylist? teacherEqList;

  String Formatedate(String date) {
    DateTime parseDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM-dd-yyyy');
    // var outputFormat2 = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  getlist(BuildContext context) async {
    isLoading = true;
    final prefs = UserPrefs();
    var id = prefs.getData("id");
    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
      "Content-type": "application/json"
    };
    final url = Uri.parse("${baseUrl}enquiry/get-all-my-enquiry");

    print(url);
    try {
      final response = await http.get(url, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        TeacherEnquirylist res = TeacherEnquirylist.fromJson(json);
        teacherEqList = res;
        // if (loginResponse.status!) {
        // } else {
        //   CostomSnackbar.show(context, "ahow");
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
    notifyListeners();
  }

  List<String> bordlist = [];
  List<String> classlist = [];
  List<String> subjectlist = [];

  setdata(int id) async {
    print(id);
    DropdownData? res = await DropdownDatas().getdata(id);

    if (id == 3) {
      bordlist = [];
      res!.data.forEach((element) {
        bordlist.add(element.propsTitle);
      });
    } else if (id == 4) {
      classlist = [];
      res!.data.forEach((element) {
        classlist.add(element.propsTitle);
      });
    } else {
      subjectlist = [];
      res!.data.forEach((element) {
        subjectlist.add(element.propsTitle);
      });
    }

    notifyListeners();
  }
}
