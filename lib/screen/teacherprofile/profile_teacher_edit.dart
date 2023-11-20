import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/dropdown.dart';
import '../commonWidget/register_textfields.dart';
import '../filter/widget/filter_common.dart';
import '../home_screen.dart';
import '../personalDetails/provider/teacherderails_provider.dart';
import 'provider/teacher_profile_provider.dart';

class TeacherProfileEdit extends StatefulWidget {
  const TeacherProfileEdit({Key? key}) : super(key: key);

  @override
  State<TeacherProfileEdit> createState() => _TeacherProfileEditState();
}

class _TeacherProfileEditState extends State<TeacherProfileEdit> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    teacherProfileProvider = Provider.of<TeacherProfileProvider>(context, listen: false);

    teacherProfileProvider!.setData();
  }

  TeacherProfileProvider? teacherProfileProvider;

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
                teacherProfileProvider!.pickImageFromSource(ImageSource.camera, side);
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
                teacherProfileProvider!.pickImageFromSource(ImageSource.gallery, side);
              },
            ),
          ],
        );
      },
    );
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 68.0, left: 18, right: 18),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Consumer<TeacherProfileProvider>(
                      builder: (context, provider, child) {
                        return Container(
                          height: 122,
                          width: 111,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: provider.profilepath == null
                                  ? DecorationImage(image: AssetImage(AssetImages.profileimage))
                                  : DecorationImage(
                                      image: FileImage(File(provider.profilepath!)),
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
                  mycon: teacherProfileProvider!.name,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'Full Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 2,
                  mycon: teacherProfileProvider!.mobile,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'Mobile',
                ),
                const SizedBox(
                  height: 15,
                ),
                DropDown(
                  dropdownState: teacherProfileProvider!.dropdownState,
                  hint: 'Gender',
                  list: const ["Male", "Female", "other"],
                  mayfun: (String val) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isicon: true,
                  isvalid: 0,
                  mycon: teacherProfileProvider!.location,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'Location',
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: teacherProfileProvider!.subject,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'Qualification (Hons in which subject)',
                ),
                const SizedBox(
                  height: 15,
                ),
                DropDown(
                  dropdownState: teacherProfileProvider!.dropdownState2,
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

                    teacherProfileProvider!.dob.text = DateFormat('yyyy-MM-dd').format(pickedDate!);
                  },
                  isvalid: 0,
                  mycon: teacherProfileProvider!.dob,
                  isicon: true,
                  icon: AssetImages.date,
                  tcolor: const Color(0xffA3A3A3),
                  hint: 'What Categories do you want to teach ',
                ),
                const SizedBox(
                  height: 15,
                ),
                RegisterTextfields(
                  isvalid: 0,
                  mycon: teacherProfileProvider!.classs,
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
                          hint: 'Select Class',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Visibility(
                            visible: provider.isshow,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xffe5e0de),
                                      blurRadius: 20.0,
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
                          Consumer<TeacherProfileProvider>(
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
