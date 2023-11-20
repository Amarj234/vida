import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../commonfun/get_location.dart';
import '../../../config/baseUrl.dart';
import '../../../model/getlocation_model.dart';

class TeacherdetaildsProvider extends ChangeNotifier {
  List<String> slclass = [];
  bool isshow = false;
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController teacherclass = TextEditingController();
  String? frontpath;
  String? backpath;
  String? profilepath;
  int? gender;

  final picker = ImagePicker();

  Future<void> pickImageFromSource(ImageSource source, int side) async {
    final image = await picker.pickImage(source: source);
    if (kDebugMode) {
      print(image!.path);
    }

    if (image != null) {
      if (side == 1) {
        frontpath = (image.path);
      } else if (side == 2) {
        backpath = (image.path);
      } else {
        profilepath = (image.path);
      }
      notifyListeners();
    }
  }

  getAddress() async {
    LocationModel? data = await GetLocation().getLatLong();
    if (kDebugMode) {
      print("mylocation234 $data");
    }
    if (data != null) {
      location.text = data.locationname;
    }
  }

  List<String> slclassvalue = [
    "Play Group - V",
    "VI - X",
    "XI - XII",
    "B.Com",
    "B.Sc",
    "NEET",
    "CAT",
    "B.Tech",
    "BCA",
    "IIT-JEE",
    "Music",
    "Drawing",
    "Dance",
    "Spoken Eng",
    "CPT",
    "Handwriting",
    "French",
    "German",
    "Sanskrit",
    "Done"
  ];

  bool isLoading = true;
  bool success = true;

  teacherRegister() async {
    isLoading = true;

    final url = Uri.parse("${baseUrl}register");

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
        if (kDebugMode) {
          print(json);
        }
      }
    } catch (e) {
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
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
