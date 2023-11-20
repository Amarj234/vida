import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../config/baseUrl.dart';

class StudentProfileProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final dropdownState = GlobalKey<FormFieldState>();
  int? gender;
  bool isLoading = false;
  bool success = false;
  register(String id, String otp) async {
    isLoading = true;

    final url = Uri.parse("${baseUrl}register");

    try {
      final response = await http.post(url, body: {
        "name": name.text,
        "email": location.text,
        "gender": landmark.text.toUpperCase(),
        "dob": classs.text,
        "id": subject.text,
        "sd": mobile.text,
        "sdf": gender,
      });

      if (response.statusCode == 200) {
        // final json = jsonDecode(response.body);

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
      }
    } catch (e) {
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
  }

  setData() {
    Future.delayed(const Duration(seconds: 1), () {
      dropdownState.currentState?.didChange('CBSC');
    });
    name.text = "Arvind Kumar";
    location.text = "198/1A ballygunge circuler road Kolkata- 7";
    landmark.text = "Kasba";
    classs.text = "XI";
    subject.text = "Mathematics, Science";
    mobile.text = "+91 9874561230";
  }
}
