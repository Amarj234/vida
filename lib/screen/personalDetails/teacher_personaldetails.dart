import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vida/screen/personalDetails/provider/teacherderails_provider.dart';
import 'package:vida/utils/color.dart';
import 'package:vida/utils/constimage.dart';
import '../../commonfun/tab_provider.dart';
import '../../utils/style.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/dropdown.dart';
import '../commonWidget/gender_select.dart';
import '../commonWidget/register_textfields.dart';
import '../filter/widget/filter_common.dart';
import '../home_screen.dart';
import 'package:intl/intl.dart';

class TeacherPersonalDetaild extends StatefulWidget {
  const TeacherPersonalDetaild({Key? key}) : super(key: key);
  @override
  State<TeacherPersonalDetaild> createState() => _TeacherPersonalDetaildState();
}

class _TeacherPersonalDetaildState extends State<TeacherPersonalDetaild> {
  final dropdownState = GlobalKey<FormFieldState>();
  TeacherdetaildsProvider? teacherdetaildsProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teacherdetaildsProvider = Provider.of<TeacherdetaildsProvider>(context, listen: false);
    final pro = Provider.of<HometabProvider>(context, listen: false);
    pro.changeUid(2);
    teacherdetaildsProvider!.getAddress();
  }

  void showImagePickerOptions(int side) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: AppColor.main,
              ),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                teacherdetaildsProvider!.pickImageFromSource(ImageSource.camera, side);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.image,
                color: AppColor.main,
              ),
              title: const Text('Pick from Gallery'),
              onTap: () {
                Navigator.pop(context);
                teacherdetaildsProvider!.pickImageFromSource(ImageSource.gallery, side);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appbackground2,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 68.0, left: 18, right: 18),
            child: Column(
              children: [
                Text(
                  "Personal Information",
                  style: GoogleFonts.roboto(
                    color: AppColor.textcolor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(" (To be filled by the Teacher)",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: AppColor.textcolor.withOpacity(.6),
                    )),
                const SizedBox(
                  height: 25,
                ),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Consumer<TeacherdetaildsProvider>(
                      builder: (context, provider, child) {
                        return Container(
                          height: 122,
                          width: 111,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: provider.profilepath == null
                                  ? DecorationImage(image: AssetImage(AssetImages.profileimage))
                                  : DecorationImage(
                                      image: FileImage(
                                        File(provider.profilepath!),
                                      ),
                                      fit: BoxFit.cover)),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 100.0, top: 85),
                        child: InkWell(
                            onTap: () {
                              showImagePickerOptions(3);
                            },
                            child: Image.asset(AssetImages.camera)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: teacherdetaildsProvider!.name,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'Full Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 2,
                  mycon: teacherdetaildsProvider!.mobile,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'Mobile',
                ),
                const SizedBox(
                  height: 15,
                ),
                GenderSelect(
                  myfun: (int val) {
                    teacherdetaildsProvider!.gender = val;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isicon: true,
                  isvalid: 0,
                  mycon: teacherdetaildsProvider!.location,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'Location',
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: teacherdetaildsProvider!.landmark,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'Qualification (Hons in which subject)',
                ),
                const SizedBox(
                  height: 15,
                ),
                DropDown(
                  dropdownState: dropdownState,
                  hint: 'schooling (Board)',
                  list: const ["CBSC", "Delhi board"],
                  mayfun: (String val) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  readonly: true,
                  myfun: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    teacherdetaildsProvider!.dob.text =
                        DateFormat('yyyy-MM-dd').format(pickedDate!);
                  },
                  isvalid: 0,
                  mycon: teacherdetaildsProvider!.dob,
                  isicon: true,
                  icon: AssetImages.date,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'DOB',
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: teacherdetaildsProvider!.classs,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'teaching experience (in year) ',
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<TeacherdetaildsProvider>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        RegisterTextfields(
                          myfun: () {
                            provider.hideShow();
                          },
                          readonly: true,
                          icon: AssetImages.arrowdown,
                          isicon: true,
                          isvalid: 0,
                          mycon: provider.teacherclass,
                          tcolor: const Color(0xffA3A3A3),
                          hint: 'What Categories do you want to teach ',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Visibility(
                            visible: provider.isshow,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Color(0xffCECBC9FF),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                  // border: Border.all(color: AppColor.oreng.withOpacity(.5)),

                                  borderRadius: BorderRadius.circular(10)),
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: -10.0, // Horizontal space.
                                //runSpacing: 30.0, // gap between lines
                                children: provider.slclassvalue.map((e) {
                                  return InkWell(
                                      overlayColor: MaterialStateProperty.all(Colors.white),
                                      onTap: () {
                                        provider.selectClass(e);
                                      },
                                      child: mychip(e, provider.slclass.contains(e)));
                                }).toList(),
                              ),
                            )),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<TeacherdetaildsProvider>(
                  builder: (context, provider, child) {
                    return Visibility(
                      visible: provider.isshow ? false : true,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Upload Document",
                                style: cstyle20w500m,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Aadhar/Voter/College ID/Driving Licence/School ID ",
                                style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff707070)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Consumer<TeacherdetaildsProvider>(
                            builder: (context, provider, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showImagePickerOptions(1);
                                    },
                                    child: provider.frontpath == null
                                        ? SvgPicture.asset(
                                            AssetImages.frontside,
                                            width: (MediaQuery.of(context).size.width / 2) - 30,
                                          )
                                        : Image.file(
                                            File(provider.frontpath!),
                                            width: (MediaQuery.of(context).size.width / 2) - 30,
                                          ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showImagePickerOptions(2);
                                    },
                                    child: provider.backpath == null
                                        ? SvgPicture.asset(
                                            AssetImages.backside,
                                            width: (MediaQuery.of(context).size.width / 2) - 30,
                                          )
                                        : Image.file(
                                            File(provider.backpath!),
                                            width: (MediaQuery.of(context).size.width / 2) - 30,
                                          ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                AppButton(
                  texcolor: Colors.white,
                  hight: 36,
                  txt: 'SUBMIT',
                  col: AppColor.main,
                  myfun: () {
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
    );
  }
}
