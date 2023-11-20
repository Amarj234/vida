import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
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
                          "Anika Gupta",
                          style: GoogleFonts.roboto(
                              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10), topLeft: Radius.circular(10)),
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
                          txt: 'Anika Gupta',
                          image: AssetImages.user,
                        ),
                        NameFields(
                          txt: '918317008979',
                          image: AssetImages.mobile,
                        ),
                        NameFields(
                          txt: 'Female',
                          image: AssetImages.gender,
                        ),
                        NameFields(
                          txt: '45/24 kakulia road, Dhakuria, Kolkata - 700020',
                          image: AssetImages.pointlocation,
                        ),
                        NameFields(
                          txt: 'B.A Hon',
                          image: AssetImages.course,
                        ),
                        NameFields(
                          txt: 'ICSE',
                          image: AssetImages.book,
                        ),
                        NameFields(
                          txt: '19 - 04 - 1986',
                          image: AssetImages.cake,
                        ),
                        NameFields(
                          txt: '7 Years',
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
                                    builder: (context) => const TeacherProfileEdit()));
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
                      image: DecorationImage(image: AssetImage(AssetImages.ankitacir)),
                      color: AppColor.appbarcolor,
                      shape: BoxShape.circle),
                  height: 96,
                  width: 96,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
