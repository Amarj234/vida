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
    teacherEnquiry =
        Provider.of<TeacherEnquiryProvider>(context, listen: false);
    teacherEnquiry!.setdata(3);
    teacherEnquiry!.setdata(4);
    teacherEnquiry!.setdata(5);
    teacherEnquiry!.massege.text = "";
  }

  final key = GlobalKey<FormState>();
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
      body: Consumer<TeacherEnquiryProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 20),
                      child: Form(
                        key: key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enquiry For Teachers",
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.main),
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
                              dropdownState: provider.dropdownState,
                              hint: 'Board',
                              list: provider.bordlist,
                              mayfun: (String val) {
                                provider.board.text = val;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            DropDown(
                              dropdownState: provider.dropdownState2,
                              hint: 'Class',
                              list: provider.classlist,
                              mayfun: (String val) {
                                provider.classs.text = val;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GenderSelect(
                              myfun: (int val) {
                                provider.gender = val;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            DropDown(
                              dropdownState: provider.dropdownState3,
                              hint: 'Subject',
                              list: provider.subjectlist,
                              mayfun: (String val) {
                                provider.subject.text = val;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextArea(
                              isvalid: 3,
                              mycon: provider.massege,
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
                                if (key.currentState!.validate()) {
                                  provider.savaEnquiry(context);
                                  // Navigator.push(
                                  //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                                }
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
        },
      ),
    );
  }
}
