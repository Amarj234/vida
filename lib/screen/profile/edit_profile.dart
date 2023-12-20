import 'package:flutter/material.dart';
import 'package:flutter_location_search/flutter_location_search.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/cancel_button.dart';
import '../commonWidget/dropdown.dart';
import '../commonWidget/gender_select.dart';
import '../commonWidget/main_appbar.dart';
import '../commonWidget/register_textfields.dart';
import '../menu/side_menu.dart';
import 'provider/student_profile_provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    studentProfileProvider = Provider.of<StudentProfileProvider>(context, listen: false);
    Future.delayed(const Duration(milliseconds: 500), () {
      studentProfileProvider!.dropdownState.currentState
          ?.didChange(studentProfileProvider!.parentProfile!.d.data.extraParm2);
    });
    studentProfileProvider!.setdata(5);
    studentProfileProvider!.setdata(3);
    studentProfileProvider!.setdata(4);

    Future.delayed(const Duration(milliseconds: 500), () {
      studentProfileProvider!.dropdownState.currentState
          ?.didChange(studentProfileProvider!.parentProfile!.d.data.extraParm2);
      studentProfileProvider!.dropdownState2.currentState
          ?.didChange(studentProfileProvider!.parentProfile!.d.data.extraParm3);
      studentProfileProvider!.dropdownState3.currentState
          ?.didChange(studentProfileProvider!.parentProfile!.d.data.extraParm5);
    });
  }

  StudentProfileProvider? studentProfileProvider;
  final key = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const SideMenu(),
      key: scaffoldKey,
      appBar: MainAppbar(
        leading: true,
        title: "Edit Profile",
        ontap: () {
          if (scaffoldKey.currentState!.isEndDrawerOpen) {
            scaffoldKey.currentState!.closeEndDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openEndDrawer();
            //open drawer, if drawer is closed
          }
        },
        context: context,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<StudentProfileProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      RegisterTextfields(
                        isvalid: 0,
                        mycon: studentProfileProvider!.name,
                        tcolor: const Color(0xff421200),
                        hint: 'Parent’s Name',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RegisterTextfields(
                        readonly: true,
                        myfun: () async {
                          LocationData? locationData = await LocationSearch.show(
                              context: context, lightAdress: false, mode: Mode.overlay);
                          studentProfileProvider!.location.text = locationData!.address;
                        },
                        isicon: true,
                        isvalid: 0,
                        mycon: studentProfileProvider!.location,
                        tcolor: const Color(0xff421200),
                        hint: 'Location',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RegisterTextfields(
                        isvalid: 0,
                        mycon: studentProfileProvider!.landmark,
                        tcolor: const Color(0xff421200),
                        hint: 'Landmark',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropDown(
                        dropdownState: studentProfileProvider!.dropdownState,
                        hint: 'Board',
                        list: studentProfileProvider!.bordlist,
                        mayfun: (String val) {
                          studentProfileProvider!.board = val;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropDown(
                        dropdownState: studentProfileProvider!.dropdownState2,
                        hint: 'Class',
                        list: studentProfileProvider!.classlist,
                        mayfun: (String val) {
                          studentProfileProvider!.classs.text = val;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GenderSelect(
                        header: "Preference Teacher",
                        myfun: (int val) {
                          studentProfileProvider!.gender = val;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropDown(
                        dropdownState: studentProfileProvider!.dropdownState3,
                        hint: 'Subject',
                        list: studentProfileProvider!.subjectlist,
                        mayfun: (String val) {
                          studentProfileProvider!.subject.text = val;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RegisterTextfields(
                        readonly: true,
                        isvalid: 2,
                        mycon: studentProfileProvider!.mobile,
                        tcolor: const Color(0xff421200),
                        hint: 'Mobile',
                      ),
                      const SizedBox(height: 30),
                      AppButton(
                        texcolor: Colors.white,
                        hight: 36,
                        txt: 'SUBMIT',
                        col: AppColor.main,
                        myfun: () {
                          if (key.currentState!.validate()) {
                            studentProfileProvider!.register(context);
                          }
                          // Navigator.push(
                          //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CancelButton(
                        txt: 'Cancel',
                        hight: 36,
                        myfun: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
