import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/utils/color.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/dropdown.dart';
import '../commonWidget/gender_select.dart';
import '../commonWidget/register_textfields.dart';
import '../home_screen.dart';
import 'provider/studentinfo_provider.dart';

class PersonalDetaild extends StatefulWidget {
  const PersonalDetaild({Key? key}) : super(key: key);

  @override
  State<PersonalDetaild> createState() => _PersonalDetaildState();
}

class _PersonalDetaildState extends State<PersonalDetaild> {
  StudentinfoProvider? sudentpro;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sudentpro = Provider.of<StudentinfoProvider>(context, listen: false);
    sudentpro!.getAddress();
  }

  final key = GlobalKey<FormState>();
  final dropdownState = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appbackground2,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 68.0, left: 18, right: 18),
            child: Form(
              key: key,
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Personal Information",
                          style: GoogleFonts.roboto(
                            color: AppColor.textcolor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                        TextSpan(
                            text: " (To be filled by the parent)",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: AppColor.textcolor.withOpacity(.6),
                            ))
                      ])),
                  const SizedBox(
                    height: 25,
                  ),
                  RegisterTextfields(
                    isvalid: 3,
                    mycon: sudentpro!.name,
                    tcolor: const Color(0xffA3A3A3),
                    hint: 'Parent’s Name',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RegisterTextfields(
                    isicon: true,
                    isvalid: 3,
                    mycon: sudentpro!.location,
                    tcolor: const Color(0xffA3A3A3),
                    hint: 'Location',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RegisterTextfields(
                    isvalid: 3,
                    mycon: sudentpro!.landmark,
                    tcolor: const Color(0xffA3A3A3),
                    hint: 'Landmark',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropDown(
                    dropdownState: dropdownState,
                    hint: 'Board',
                    list: const ["CBSC", "Delhi board"],
                    mayfun: (String val) {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RegisterTextfields(
                    isvalid: 3,
                    mycon: sudentpro!.classs,
                    tcolor: const Color(0xffA3A3A3),
                    hint: 'Class',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GenderSelect(
                    myfun: (int val) {
                      print("gender val");
                      sudentpro!.gender = val;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RegisterTextfields(
                    isvalid: 3,
                    mycon: sudentpro!.subject,
                    tcolor: const Color(0xffA3A3A3),
                    hint: 'Subject',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RegisterTextfields(
                    isvalid: 2,
                    mycon: sudentpro!.mobile,
                    tcolor: const Color(0xffA3A3A3),
                    hint: 'Mobile',
                  ),
                  const SizedBox(height: 40),
                  AppButton(
                    texcolor: Colors.white,
                    hight: 36,
                    txt: 'SUBMIT',
                    col: AppColor.main,
                    myfun: () {
                      // if (key.currentState!.validate()) {}

                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
      ),
    );
  }
}
