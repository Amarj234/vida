import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../commonfun/get_location.dart';
import '../../../config/baseUrl.dart';
import '../../../model/getlocation_model.dart';

class TeacherListProvider extends ChangeNotifier {
  String? culocation = "";

  getAddress() async {
    LocationModel? data = await GetLocation().getLatLong();
    print("mylocation234 $data");
    if (data != null) {
      culocation = data.locationname;
      notifyListeners();
    }
  }

  bool isLoading = false;
  bool success = false;

  getlist(BuildContext context) async {
    isLoading = true;

    final url = Uri.parse("${baseUrl}register");

    print(url);
    try {
      final response = await http.post(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

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
  }
}
