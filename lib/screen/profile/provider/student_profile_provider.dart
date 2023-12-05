// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../commonfun/dropdowndata.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/dropdown_data.dart';
import '../../../model/parent_profile.dart';
import '../../commonWidget/costum_snackbar.dart';
import '../../home_screen.dart';
import '../../selectlocation/provider/tabprovider.dart';

class StudentProfileProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final dropdownState = GlobalKey<FormFieldState>();
  final dropdownState2 = GlobalKey<FormFieldState>();
  final dropdownState3 = GlobalKey<FormFieldState>();
  int? gender;
  String? board;
  bool isLoading = false;
  bool success = false;

  ParentProfile? parentProfile;

  List<String> bordlist = [];
  List<String> classlist = [];
  List<String> subjectlist = [];

  bool isLoding = false;
  setdata(int id) async {
    DropdownData? res = await DropdownDatas().getdata(id);

    if (id == 3) {
      bordlist = [];
      for (var element in res!.data) {
        bordlist.add(element.propsTitle);
      }
      bordlist.add("Done");
    } else if (id == 4) {
      classlist = [];
      for (var element in res!.data) {
        classlist.add(element.propsTitle);
      }
      classlist.add("Done");
    } else {
      subjectlist = [];
      for (var element in res!.data) {
        subjectlist.add(element.propsTitle);
      }
      subjectlist.add("Done");
    }
    isLoding = false;
    notifyListeners();
  }

  register(BuildContext context) async {
    isLoading = true;
    final prefs = UserPrefs();
    var id = prefs.getData("id");
    var token = prefs.getData("token");
    final url = Uri.parse("${baseUrl}user/profile-update-parent");
    Map<String, String> headers = {
      "x-access-token": "$token",
      "Content-type": "application/json"
    };
    Map data = {
      "id": int.parse(id.toString()),
      "parentName": name.text,
      "location": location.text,
      "landmark": landmark.text,
      "board": board,
      "class": classs.text,
      "teacherPrefarence": gender == 0
          ? "M"
          : gender == 1
              ? "F"
              : "ANY",
      "subject": subject.text,
      "phoneNumber": mobile.text
    };

    try {
      final response =
          await http.post(url, body: jsonEncode(data), headers: headers);
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['status'] == true) {
          // RegisterRes res = RegisterRes.fromJson(json);
          success = true;
          CostomSnackbar.show(
              context, "${jsonDecode(response.body)['message']}");
          // }
        }
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const HomeScreen(
                      index: 2,
                    )));

        isLoading = false;
      } else {
        CostomSnackbar.show(context, jsonDecode(response.body)['message'][0]);
      }
    } catch (e) {
      CostomSnackbar.show(context, "$e");
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  getdata(BuildContext context) async {
    isLoading = true;
    final prefs = UserPrefs();
    var id = prefs.getData("id");
    var token = prefs.getData("token");
    final url = Uri.parse("${baseUrl}user/user-profile?id=$id");
    Map<String, String> headers = {
      "x-access-token": "$token",
      "Content-type": "application/json"
    };
    final response = await http.get(url, headers: headers);
    final json = jsonDecode(response.body);
    ParentProfile res = ParentProfile.fromJson(json);
    if (res.status == true) {
      parentProfile = res;
      isLoading = false;

      setData(res.d.data, context);
    }
    notifyListeners();
  }

  setData(Data data, BuildContext context) {
    name.text = data.name;
    location.text = data.location;
    landmark.text = data.extraParm1;
    classs.text = data.extraParm3;
    subject.text = data.extraParm5;
    mobile.text = data.phoneNo;
    final pro = Provider.of<TabProvider>(context, listen: false);
    pro.SelectRadio(data.extraParm4 == "M"
        ? 0
        : data.extraParm4 == "F"
            ? 1
            : 2);
  }
}
