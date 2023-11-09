import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/utils/color.dart';

import '../../utils/constimage.dart';
import '../commonWidget/app_button.dart';
import 'edit_profile.dart';
import 'widget/name_fields.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                          "Arvind Kumar",
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
                          txt: 'Arvind Kumar',
                          image: AssetImages.user,
                        ),
                        NameFields(
                          txt: '198/1A ballygunge circuler road Kolkata- 700029',
                          image: AssetImages.pointlocation,
                        ),
                        NameFields(
                          txt: 'Kasba',
                          image: AssetImages.pointlocation,
                        ),
                        NameFields(
                          txt: 'ICSE',
                          image: AssetImages.book,
                        ),
                        NameFields(
                          txt: 'XI',
                          image: AssetImages.medal,
                        ),
                        NameFields(
                          txt: 'ICSE',
                          image: AssetImages.book,
                        ),
                        NameFields(
                          txt: 'Female',
                          image: AssetImages.gender,
                        ),
                        NameFields(
                          txt: 'Mathematics, Science',
                          image: AssetImages.pen,
                        ),
                        NameFields(
                          txt: '+91 9874561230',
                          image: AssetImages.mobile,
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const EditProfile()));
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
                  decoration:
                      const BoxDecoration(color: AppColor.appbarcolor, shape: BoxShape.circle),
                  height: 96,
                  width: 96,
                  child: Text(
                    "AK",
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
