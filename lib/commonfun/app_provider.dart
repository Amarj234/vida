import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vida/commonfun/tab_provider.dart';
import '../screen/enquiry/provider/teacher_enquiry_provider.dart';
import '../screen/filter/provider/filer_provider.dart';

import '../screen/lead/provider/lead_provider.dart';
import '../screen/notification/provider/notification_provider.dart';
import '../screen/otplogin/provider/login_provider.dart';
import '../screen/personalDetails/provider/studentinfo_provider.dart';
import '../screen/personalDetails/provider/teacherderails_provider.dart';
import '../screen/profile/provider/student_profile_provider.dart';
import '../screen/selectlocation/provider/tabprovider.dart';
import '../screen/splase/provider/appmessage_provider.dart';
import '../screen/student/provider/student_list_provider.dart';
import '../screen/subscribe/provider/subscribe_provider.dart';
import '../screen/teacherprofile/provider/teacher_profile_provider.dart';
import '../screen/teachers/provider/teacherlist_provider.dart';
import 'balance_provider.dart';

class AppProvider {
  AppProvider._();

  static final AppProvider appProvider = AppProvider._();

  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => TabProvider()),
      ChangeNotifierProvider(create: (_) => HometabProvider()),
      ChangeNotifierProvider(create: (_) => FilterProvider()),
      ChangeNotifierProvider(create: (_) => TeacherdetaildsProvider()),
      ChangeNotifierProvider(create: (_) => StudentinfoProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => TeacherProfileProvider()),
      ChangeNotifierProvider(create: (_) => StudentProfileProvider()),
      ChangeNotifierProvider(create: (_) => TeacherListProvider()),
      ChangeNotifierProvider(create: (_) => StudentListProvider()),
      ChangeNotifierProvider(create: (_) => TeacherEnquiryProvider()),
      ChangeNotifierProvider(create: (_) => LeadProvider()),
      ChangeNotifierProvider(create: (_) => AppmessageProvider()),
      ChangeNotifierProvider(create: (_) => BalanceProvider()),
      ChangeNotifierProvider(create: (_) => SubscribeProvider()),
      ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ];
  }
}
