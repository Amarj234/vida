import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class TeacherProfileProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController dob = TextEditingController();
  final dropdownState = GlobalKey<FormFieldState>();
  final dropdownState2 = GlobalKey<FormFieldState>();

  String? frontpath;
  String? backpath;
  String? profilepath;
  int? gender;

  final picker = ImagePicker();

  setData() {
    Future.delayed(const Duration(seconds: 1), () {
      dropdownState.currentState?.didChange('Male');
      dropdownState2.currentState?.didChange('CBSC');
    });

    name.text = "Arvind Kumar";
    location.text = "198/1A ballygunge circuler road Kolkata- 7";
    landmark.text = "Kasba";
    classs.text = "7 years";
    subject.text = "B.A Hon";
    mobile.text = "+91 9874561230";
    dob.text = "19-04-1986";
  }

  Future<void> pickImageFromSource(ImageSource source, int side) async {
    final image = await picker.pickImage(source: source);
    print(image!.path);

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
}
