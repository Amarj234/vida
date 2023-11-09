import 'package:flutter/cupertino.dart';

import '../screen/enquiry/my_enquiry.dart';
import '../screen/profile/profile_screen.dart';
import '../screen/teachers/teacher_list.dart';

class HometabProvider extends ChangeNotifier {
  int index = 0;

  List<Widget> myPageList = [const TeacherList(), const MyEnquiry(), const ProfileScreen()];
  void onItemTapped(int ind) {
    index = ind;
    notifyListeners();
  }
}
