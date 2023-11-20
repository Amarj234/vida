import 'package:flutter/cupertino.dart';

import '../screen/enquiry/my_enquiry.dart';
import '../screen/lead/my_lead.dart';
import '../screen/profile/profile_screen.dart';
import '../screen/student/student_list.dart';
import '../screen/teacherprofile/teacher_profile.dart';
import '../screen/teachers/teacher_list.dart';

class HometabProvider extends ChangeNotifier {
  int index = 0;
  int uid = 1;
  bool issavecard = true;

  List<Widget> myPageList = [const TeacherList(), const MyEnquiry(), const ProfileScreen()];
  List<Widget> myPageList2 = [const StudentList(), const MyLead(), const TeacherProfile()];
  void onItemTapped(int ind) {
    index = ind;
    notifyListeners();
  }

  void changeUid(int ind) {
    uid = ind;
    notifyListeners();
  }

  void saveCard() {
    issavecard = !issavecard;
    notifyListeners();
  }
}
