import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/config/baseUrl.dart';
import 'package:vida/screen/teacherprofile/provider/teacher_profile_provider.dart';
import 'package:vida/utils/color.dart';

import '../../utils/constimage.dart';
import '../commonWidget/app_button.dart';
import '../profile/widget/name_fields.dart';
import 'profile_teacher_edit.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    teacherProfileProvider =
        Provider.of<TeacherProfileProvider>(context, listen: false);

    teacherProfileProvider!.getdata();
  }

  TeacherProfileProvider? teacherProfileProvider;
  String toCapitalized(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<TeacherProfileProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                color: AppColor.radiocolr,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    toCapitalized(teacherProfileProvider!
                                        .teacherProfile!.d.data.name),
                                    style: GoogleFonts.roboto(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(.3),
                                    //blurRadius: 5,
                                    spreadRadius: 12,
                                  ),
                                  BoxShadow(
                                    color: Colors.white.withOpacity(.5),
                                    //blurRadius: 5,
                                    spreadRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  NameFields(
                                    txt: toCapitalized(teacherProfileProvider!
                                        .teacherProfile!.d.data.name),
                                    image: AssetImages.user,
                                  ),
                                  NameFields(
                                    txt: teacherProfileProvider!
                                        .teacherProfile!.d.data.phoneNo,
                                    image: AssetImages.mobile,
                                  ),
                                  NameFields(
                                    txt: teacherProfileProvider!.teacherProfile!
                                                .d.data.extraParm1 ==
                                            "M"
                                        ? "Male"
                                        : teacherProfileProvider!
                                                    .teacherProfile!
                                                    .d
                                                    .data
                                                    .extraParm1 ==
                                                "F"
                                            ? "Female"
                                            : "Other",
                                    image: AssetImages.gender,
                                  ),
                                  NameFields(
                                    txt: teacherProfileProvider!
                                        .teacherProfile!.d.data.location,
                                    image: AssetImages.pointlocation,
                                  ),
                                  NameFields(
                                    txt: teacherProfileProvider!.teacherProfile!
                                            .d.data.extraParm2 ??
                                        "",
                                    image: AssetImages.course,
                                  ),
                                  NameFields(
                                    txt: teacherProfileProvider!.teacherProfile!
                                            .d.data.extraParm3 ??
                                        "",
                                    image: AssetImages.book,
                                  ),
                                  NameFields(
                                    txt: teacherProfileProvider!
                                        .formateDate(teacherProfileProvider!
                                            .teacherProfile!.d.data.dob
                                            .toString())
                                        .toString(),
                                    image: AssetImages.cake,
                                  ),
                                  NameFields(
                                    txt:
                                        '${teacherProfileProvider!.teacherProfile!.d.data.extraParm4} Years',
                                    image: AssetImages.medal,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  AppButton(
                                    texcolor: Colors.white,
                                    hight: 30,
                                    txt: 'Edit',
                                    col: const Color(0xff421200),
                                    myfun: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TeacherProfileEdit()));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 150,
                          left: (MediaQuery.of(context).size.width / 2) - 48,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "$baseImgUrl${teacherProfileProvider!.teacherProfile!.d.data.userImage}")),
                                color: AppColor.appbarcolor,
                                shape: BoxShape.circle),
                            height: 96,
                            width: 96,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
