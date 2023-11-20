import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/utils/color.dart';

import '../commonWidget/app_button.dart';
import '../commonWidget/dropdown.dart';
import '../commonWidget/gender_select.dart';
import '../commonWidget/main_appbar.dart';
import '../commonWidget/register_textfields.dart';
import '../commonWidget/text_area.dart';

import '../menu/side_menu.dart';
import 'provider/teacher_enquiry_provider.dart';

class TeacherEnquiry extends StatefulWidget {
  const TeacherEnquiry({Key? key}) : super(key: key);

  @override
  State<TeacherEnquiry> createState() => _TeacherEnquiryState();
}

class _TeacherEnquiryState extends State<TeacherEnquiry> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TeacherEnquiryProvider? teacherEnquiry;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teacherEnquiry = Provider.of<TeacherEnquiryProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const SideMenu(),
      backgroundColor: AppColor.appbackground2,
      appBar: MainAppbar(
        ontap: () {
          if (scaffoldKey.currentState!.isEndDrawerOpen) {
            scaffoldKey.currentState!.closeEndDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openEndDrawer();
            //open drawer, if drawer is closed
          }
        },
        leading: true,
        context: context,
        title: "Requirements",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enquiry For Teachers",
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w500, color: AppColor.main),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   "If you do not want to pay the subscription fee then you can send me a requirement and the suitable teachers will contact you.",
                //   style: GoogleFonts.roboto(
                //       fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xff333333)),
                // ),
                const SizedBox(
                  height: 20,
                ),
                DropDown(
                  dropdownState: teacherEnquiry!.dropdownState,
                  hint: 'Board',
                  list: const ["CBSC", "Delhi board"],
                  mayfun: (String val) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: teacherEnquiry!.classs,
                  tcolor: const Color(0xff421200),
                  hint: 'Class',
                ),
                const SizedBox(
                  height: 15,
                ),
                GenderSelect(
                  myfun: (int val) {
                    teacherEnquiry!.gender = val;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: teacherEnquiry!.subject,
                  tcolor: const Color(0xff421200),
                  hint: 'Subject',
                ),
                const SizedBox(
                  height: 15,
                ),
                TextArea(
                  isvalid: 0,
                  mycon: teacherEnquiry!.massege,
                  tcolor: const Color(0xff421200),
                  hint: 'Write your Message',
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  texcolor: Colors.white,
                  hight: 36,
                  txt: 'SUBMIT',
                  col: AppColor.main,
                  myfun: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
