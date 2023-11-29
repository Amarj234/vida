import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dioClient;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../commonfun/dropdowndata.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/dropdown_data.dart';
import '../../../model/teacher_profile.dart';
import '../../commonWidget/costum_snackbar.dart';
import '../../home_screen.dart';

class TeacherProfileProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController exp = TextEditingController();
  TextEditingController teacherclass = TextEditingController();
  TextEditingController qualification = TextEditingController();
  final dropdownState = GlobalKey<FormFieldState>();
  final dropdownState2 = GlobalKey<FormFieldState>();
  TeacherProfile? teacherProfile;
  String? frontpath;
  String? backpath;
  String? board;
  String? profilepath;
  double? longitude;
  double? latitude;
  int? gender;
  bool isLoading = false;
  bool success = false;
  final picker = ImagePicker();

  String Formatedate(String date) {
    DateTime parseDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM-dd-yyyy');
    var outputFormat2 = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat2.format(inputDate);
    return outputDate;
  }

  teacherRegister(BuildContext context) async {
    print("teacherRegister");
    final prefs = UserPrefs();
    var id = prefs.getData("id");
    isLoading = true;
    notifyListeners();

    var token = prefs.getData("token");
    Map<String, String> headers = {
      "x-access-token": "$token",
    };
    final dio = dioClient.Dio(
      dioClient.BaseOptions(
        contentType: "multipart/form-data",
        headers: headers,
      ),
    );
    final url = Uri.parse("${baseUrl}user/profile-update-teacher");
    print("$url $id  $gender ${mobile.text} $profilepath");

    //  try {
    final formData = <String, dynamic>{
      'id': id.toString(),
      'fullName': name.text,
      'location': location.text,
      'school': board!,
      'teacherExparence': exp.text,
      'dob': dob.text,
      'subject': slsubject.join(","),
      'class': slclass.join(','),
      'phoneNumber': mobile.text,
      'qualification': qualification.text,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'gender': gender == 0
          ? "M"
          : gender == 1
              ? "F"
              : "ANY",
    };

    if (frontpath != null) {
      formData.addEntries({
        'document_1': (await MultipartFile.fromFile(frontpath!,
            contentType: MediaType('image', frontpath!.split('.').last)))
      }.entries);
    }
    if (backpath != null) {
      formData.addEntries({
        'document_2': (await MultipartFile.fromFile(backpath!,
            contentType: MediaType('image', backpath!.split('.').last)))
      }.entries);
    }
    if (profilepath != null) {
      formData.addEntries({
        'uploded_image': (await MultipartFile.fromFile(profilepath!,
            contentType: MediaType('image', profilepath!.split('.').last)))
      }.entries);
    }

    final response = await dio.request(
      "${baseUrl}user/profile-update-teacher",
      data: FormData.fromMap(formData),
      options: dioClient.Options(
        followRedirects: false,
        validateStatus: (status) {
          print("mystatus $status");
          return status! < 500;
        },
        method: 'post',
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    log("${response.data}");
    if (response.statusCode == 200) {
      if (response.data['status'] == true) {
        // Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const HomeScreen(
                      index: 2,
                    )));
        success = true;
        //   });
      }
      isLoading = false;
    } else {
      CostomSnackbar.show(context, jsonDecode(response.data)['message'][0]);
    }
    isLoading = false;
    log("${response.data}");

    // success = true;
    // } catch (e) {
    //   print("error $e");
    //   //Get.snackbar('Error', 'An error occurred');
    // } finally {
    //   isLoading = false;
    // }
    notifyListeners();
  }

  getdata() async {
    isLoading = true;
    final prefs = UserPrefs();
    var id = prefs.getData("id");
    final url = Uri.parse("${baseUrl}user/user-profile?id=$id");

    print(url);
    var token = prefs.getData("token");
    Map<String, String> headers = {
      "x-access-token": "$token",
      "Content-type": "application/json"
    };
    final response = await http.get(url, headers: headers);
    final json = jsonDecode(response.body);
    TeacherProfile res = TeacherProfile.fromJson(json);
    if (res.status == true) {
      teacherProfile = res!;
      isLoading = false;

      setData(res.d.data);
    }
    notifyListeners();
  }

  setData(Data data) {
    name.text = data.name;
    location.text = data.location;
    longitude = double.parse(data.longitude);
    latitude = double.parse(data.latitude);
    exp.text = "${data.extraParm4} ";
    qualification.text = data.extraParm2!;
    mobile.text = data.phoneNo;
    teacherclass.text = data.extraParm5!;
    subject.text = data.extraParm6!;
    dob.text = Formatedate(data.dob.toString());
    slclass = [];
    slsubject = [];

    data.extraParm5!.split(",").forEach((element) {
      slclass.add(element);
    });
    data.extraParm6!.split(",").forEach((element) {
      slsubject.add(element);
    });
  }

  Future<void> pickImageFromSource(ImageSource source, int side) async {
    final image = await picker.pickImage(source: source);

    if (image!.path != null) {
      if (side == 1) {
        frontpath = (image.path);
      } else if (side == 2) {
        backpath = (image.path);
      } else {
        profilepath = (image.path);
      }
    }
    notifyListeners();
  }

  List<String> slclass = [];
  List<String> slsubject = [];
  bool isshow = false;
  bool isshowsub = false;
  List<String> bordlist = [];
  List<String> classlist = [];
  List<String> subjectlist = [];

  bool isLoding = false;
  setdata(int id) async {
    DropdownData? res = await DropdownDatas().getdata(id);

    if (id == 3) {
      bordlist = [];
      res!.data.forEach((element) {
        bordlist.add(element.propsTitle);
      });
      bordlist.add("Done");
    } else if (id == 4) {
      classlist = [];
      res!.data.forEach((element) {
        classlist.add(element.propsTitle);
      });
      classlist.add("Done");
    } else {
      subjectlist = [];
      res!.data.forEach((element) {
        subjectlist.add(element.propsTitle);
      });
      subjectlist.add("Done");
    }
    isLoding = false;
    notifyListeners();
  }

  selectSubject(String val) {
    if (val == "Done") {
      isshowsub = !isshowsub;
      notifyListeners();
    } else {
      if (slsubject.contains(val) == true) {
        slsubject.remove(val);
      } else {
        slsubject.add(val);
      }
      notifyListeners();
      addsub();
    }
  }

  hideShowsub() {
    isshowsub = !isshowsub;
    notifyListeners();
  }

  addsub() {
    var stringList = slsubject.join(",");

    subject.text = stringList;
  }

  selectClass(String val) {
    if (val == "Done") {
      isshow = !isshow;
      notifyListeners();
    } else {
      if (slclass.contains(val) == true) {
        slclass.remove(val);
      } else {
        slclass.add(val);
      }
      notifyListeners();
      addclass();
    }
  }

  hideShow() {
    isshow = !isshow;
    notifyListeners();
  }

  String? data;
  addclass() {
    var stringList = slclass.join(",");

    teacherclass.text = stringList;
  }
}
