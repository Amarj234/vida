import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dioClient;
import 'package:provider/provider.dart';
import '../../../commonfun/dropdowndata.dart';
import '../../../commonfun/get_location.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/dropdown_data.dart';
import '../../../model/getlocation_model.dart';
import '../../commonWidget/costum_snackbar.dart';
import '../../selectlocation/provider/tabprovider.dart';

class TeacherdetaildsProvider extends ChangeNotifier {
  List<String> slclass = [];
  List<String> slsubject = [];
  bool isshow = false;
  bool isshowsub = false;
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();

  TextEditingController exp = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController teacherclass = TextEditingController();
  String? frontpath;
  String? backpath;
  String? profilepath;
  String? board;
  int? gender = 0;

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
      longitude = data.long;
      latitude = data.lat;
    }
  }

  bool isLoading = true;
  bool success = true;
  double? longitude;

  double? latitude;

  teacherRegister(BuildContext context, String rid) async {
    final prefs = UserPrefs();
    var id = prefs.getData("id");
    isLoading = true;
    notifyListeners();
    Map<String, String> headers = {
      //"Authorization": "Bearer $token",
      "Content-type": "multipart/form-data"
    };
    final dio = dioClient.Dio(
      dioClient.BaseOptions(
        contentType: "multipart/form-data",
        headers: headers,
      ),
    );

    final tab = Provider.of<TabProvider>(context, listen: false);

    try {
      final formData = <String, dynamic>{
        'id': id.toString(),
        'fullName': name.text,
        'location': location.text,
        'school': board!,
        'teacherExparence': exp.text,
        'dob': dob.text,
        "list": tab.tabval.join(","),
        'class': slclass.join(","),
        'subject': slsubject.join(","),
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

      final response = await dio.post(
        "${baseUrl}registration-teacher",
        data: FormData.fromMap(formData),
        options: dioClient.Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          method: 'post',
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        if (response.data['status'] == true) {
          success = true;
        } else {
          CostomSnackbar.show(context, jsonDecode(response.data)['message']);
        }
        isLoading = false;
      } else {
        CostomSnackbar.show(context, jsonDecode(response.data)['message']);
        //CostomSnackbar.show(context, jsonDecode(response.data)['message'][0]);
      }
      isLoading = false;

      // success = true;
    } catch (e) {
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  // teacherRegister(BuildContext context, String rid) async {
  //   print("teacherRegister");
  //   final prefs = UserPrefs();
  //   var id = prefs.getData("id");
  //   // isLoading = true;
  //   notifyListeners();
  //   Map<String, String> headers = {
  //     //"Authorization": "Bearer $token",
  //     //"Content-type": "application/json"
  //     "Content-type": "multipart/form-data"
  //   };
  //   final url = Uri.parse("${baseUrl}registration-teacher");
  //   print("$url $id  $longitude ${exp.text} $profilepath");
  //
  //   try {
  //     var request = http.MultipartRequest('POST', url);
  //     if (frontpath != null) {
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'document_1',
  //         frontpath!,
  //       ));
  //     }
  //     if (backpath != null) {
  //       request.files
  //           .add(await http.MultipartFile.fromPath('document_1', backpath!));
  //     }
  //     if (profilepath != null) {
  //       request.files.add(
  //           await http.MultipartFile.fromPath('uploded_image', profilepath!));
  //     }
  //     request.headers["Content-type"] = "multipart/form-data";
  //     request.fields['id'] = id.toString();
  //     request.fields['fullName'] = name.text;
  //     request.fields['location'] = location.text;
  //     request.fields['school'] = board!;
  //     request.fields['teacherExparence'] = exp.text;
  //     request.fields['dob'] = dob.text;
  //     request.fields['subject'] = jsonEncode(slclass);
  //     request.fields['phoneNumber'] = mobile.text;
  //     request.fields['qualification'] = qualification.text;
  //     request.fields['latitude'] = latitude.toString();
  //     request.fields['longitude'] = longitude.toString();
  //     request.fields['studentPreference'] = gender == 0
  //         ? "M"
  //         : gender == 1
  //             ? "F"
  //             : "ANY";
  //
  //     final streamedResponse = await request.send();
  //     final response = await http.Response.fromStream(streamedResponse);
  //     //     final response =
  //     //         await http.post(url, body: jsonEncode(data), headers: headers);
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body);
  //       print(response.body);
  //       if (jsonDecode(response.body)['status'] == true) {
  //         // RegisterRes res = RegisterRes.fromJson(json);
  //         success = true;
  //         // }
  //       } else {
  //         CostomSnackbar.show(context, jsonDecode(response.body)['message']);
  //       }
  //       // LoginResponse loginResponse = await getToken(otp, mobile);
  //       // print(" print tocken ${loginResponse.apiTokenPlainText}  $otp $mobile");
  //       // if (loginResponse.status!) {
  //       //   //  Get.offAllNamed(NavigationMount.route);
  //       //
  //       //   prefs.setToken(loginResponse.apiTokenPlainText!);
  //       //   prefs.setData("login", "yes");
  //       //   Get.to(ReasonOptions());
  //       //   // prefs.saveRegStatus();
  //       //
  //       //   print("Token: ${loginResponse.apiTokenPlainText}");
  //       // } else {
  //       //   Get.snackbar("Error", loginResponse.message!);
  //       // }
  //
  //       isLoading = false;
  //       // success = true;
  //       if (kDebugMode) {
  //         print(json);
  //       }
  //     } else {
  //       CostomSnackbar.show(context, jsonDecode(response.body)['message']);
  //     }
  //   } catch (e) {
  //     print("$e");
  //     //Get.snackbar('Error', 'An error occurred');
  //   } finally {
  //     isLoading = false;
  //   }
  //   notifyListeners();
  // }

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

  hideShow() {
    isshow = !isshow;
    notifyListeners();
  }

  hideShowsub() {
    isshowsub = !isshowsub;
    notifyListeners();
  }

  String? data;
  addclass() {
    var stringList = slclass.join(",");

    teacherclass.text = stringList;
  }

  addsub() {
    var stringList = slsubject.join(",");

    subject.text = stringList;
  }
}
