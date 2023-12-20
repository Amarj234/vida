import 'package:flutter/material.dart';
import 'package:flutter_location_search/flutter_location_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/utils/color.dart';
import 'package:vida/utils/constimage.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/costum_snackbar.dart';
import '../commonWidget/dropdown.dart';
import '../commonWidget/gender_select.dart';
import '../commonWidget/register_textfields.dart';

import '../otplogin/login_screen.dart';
import 'provider/studentinfo_provider.dart';

class PersonalDetaild extends StatefulWidget {
  const PersonalDetaild({Key? key, required this.rid, required this.mobile}) : super(key: key);
  final String rid;
  final String mobile;

  @override
  State<PersonalDetaild> createState() => _PersonalDetaildState();
}

class _PersonalDetaildState extends State<PersonalDetaild> {
  StudentinfoProvider? sudentpro;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    sudentpro = Provider.of<StudentinfoProvider>(context, listen: false);
    sudentpro!.getAddress();
    sudentpro!.setdata(3);
    sudentpro!.setdata(4);
    sudentpro!.setdata(5);

    sudentpro!.mobile.text = widget.mobile;
    sudentpro!.success = false;
    sudentpro!.isLoading = false;
    sudentpro!.name.clear();
    sudentpro!.subject.clear();
    sudentpro!.landmark.clear();
    sudentpro!.classs.clear();
    // });
  }

  final key = GlobalKey<FormState>();
  final dropdownState = GlobalKey<FormFieldState>();
  final dropdownState2 = GlobalKey<FormFieldState>();
  final dropdownState3 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.appbackground2,
      body: SafeArea(
        child: Consumer<StudentinfoProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.success
                    ? Center(
                        child: SizedBox(
                          height: size.height * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetImages.success,
                                height: size.height * .2,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Your are successfully registered.",
                                textAlign: TextAlign.center,
                                style: TextStyle(height: 1.5),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.main,
                                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.2)),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginScreen(
                                                uid: 1,
                                              )));
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 68.0, left: 18, right: 18),
                        child: SingleChildScrollView(
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
                                  readonly: true,
                                  myfun: () async {
                                    LocationData? locationData = await LocationSearch.show(
                                        context: context, lightAdress: false, mode: Mode.overlay);
                                    sudentpro!.location.text = locationData!.address;
                                    sudentpro!.longitude = locationData.longitude;
                                    sudentpro!.latitude = locationData.latitude;
                                  },
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
                                Consumer<StudentinfoProvider>(
                                  builder: (context, provider, child) {
                                    return DropDown(
                                      dropdownState: dropdownState,
                                      hint: 'Board',
                                      list: provider.bordlist,
                                      mayfun: (String val) {
                                        sudentpro!.board = val;
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Consumer<StudentinfoProvider>(
                                  builder: (context, provider, child) {
                                    return DropDown(
                                      dropdownState: dropdownState2,
                                      hint: 'Class',
                                      list: provider.classlist,
                                      mayfun: (String val) {
                                        sudentpro!.classs.text = val;
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                GenderSelect(
                                  header: "Preference Teacher",
                                  myfun: (int val) {
                                    sudentpro!.gender = val;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Consumer<StudentinfoProvider>(
                                  builder: (context, provider, child) {
                                    return DropDown(
                                      dropdownState: dropdownState3,
                                      hint: 'Subject',
                                      list: provider.subjectlist,
                                      mayfun: (String val) {
                                        sudentpro!.subject.text = val;
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                RegisterTextfields(
                                  readonly: true,
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
                                    if (sudentpro!.name.text.length > 10) {
                                      if (key.currentState!.validate()) {
                                        sudentpro!.register(context, widget.rid);
                                      }
                                    } else {
                                      CostomSnackbar.show(context,
                                          "parentName must be longer than or equal to 10 characters");
                                    }
                                    // Navigator.push(
                                    //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
          },
        ),
      ),
    );
  }
}
