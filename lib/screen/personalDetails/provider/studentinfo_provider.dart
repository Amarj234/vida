import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../commonfun/dropdowndata.dart';
import '../../../commonfun/get_location.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/dropdown_data.dart';
import '../../../model/getlocation_model.dart';
import '../../commonWidget/costum_snackbar.dart';
import '../../selectlocation/provider/tabprovider.dart';

class StudentinfoProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController mobile = TextEditingController();
  int? gender = 0;
  String? board;
  double? longitude;

  double? latitude;
  bool isLoading = false;
  bool success = false;

  getAddress() async {
    LocationModel? data = await GetLocation().getLatLong();
    print("mylocation234 ${data}");
    if (data != null) {
      location.text = data.locationname;
      longitude = data.long;
      latitude = data.lat;
    }
  }

  bool isLoding = false;

  List<String> bordlist = [];
  List<String> classlist = [];
  List<String> subjectlist = [];

  setdata(int id) async {
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
    isLoding = false;
    notifyListeners();
  }

//9415897676
  register(BuildContext context, String rid) async {
    isLoading = true;
    notifyListeners();
    final prefs = UserPrefs();
    var id = prefs.getData("id");
    final url = Uri.parse("${baseUrl}registration");
    Map<String, String> headers = {
      //"Authorization": "Bearer $token",
      "Content-type": "application/json"
    };
    final tab = Provider.of<TabProvider>(context, listen: false);
    Map data = {
      "id": int.parse(id.toString()),
      "parentName": name.text,
      "location": location.text,
      "landmark": landmark.text,
      "board": board,
      "class": 12,
      "list": (tab.tabval).join(","),
      "teacherPrefarence": gender == 0
          ? "M"
          : gender == 1
              ? "F"
              : "ANY",
      "subject": subject.text,
      "longitude": longitude.toString(),
      "latitude": latitude.toString(),
      "phoneNumber": mobile.text
    };

    print("${url} ${classs.text}");

    try {
      final response =
          await http.post(url, body: jsonEncode(data), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(jsonDecode(response.body)['status']);
        if (jsonDecode(response.body)['status'] == true) {
          // RegisterRes res = RegisterRes.fromJson(json);
          success = true;
          // }
        }
        isLoading = false;

        print(json);
      } else {
        CostomSnackbar.show(context, jsonDecode(response.body)['message'][0]);
      }
    } catch (e) {
      print("object $e");
      CostomSnackbar.show(context, "$e");
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }
}
