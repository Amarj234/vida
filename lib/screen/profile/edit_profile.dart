import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/cancel_button.dart';
import '../commonWidget/dropdown.dart';
import '../commonWidget/gender_select.dart';
import '../commonWidget/main_appbar.dart';
import '../commonWidget/register_textfields.dart';
import '../menu/side_menu.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController classs = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController mobile = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    name.text = "Arvind Kumar";
    location.text = "198/1A ballygunge circuler road Kolkata- 7";
    landmark.text = "Kasba";
    classs.text = "XI";
    subject.text = "Mathematics, Science";
    mobile.text = "+91 9874561230";
  }

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: name,
                  tcolor: const Color(0xff421200),
                  hint: 'Parent’s Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isicon: true,
                  isvalid: 0,
                  mycon: location,
                  tcolor: const Color(0xff421200),
                  hint: 'Location',
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: landmark,
                  tcolor: const Color(0xff421200),
                  hint: 'Landmark',
                ),
                const SizedBox(
                  height: 15,
                ),
                DropDown(
                  hint: 'Board',
                  list: const ["CBSC", "Delhi board"],
                  mayfun: (String val) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: classs,
                  tcolor: const Color(0xff421200),
                  hint: 'Class',
                ),
                const SizedBox(
                  height: 15,
                ),
                const GenderSelect(),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: subject,
                  tcolor: const Color(0xff421200),
                  hint: 'Subject',
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 2,
                  mycon: mobile,
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
        ),
      ),
    );
  }
}
