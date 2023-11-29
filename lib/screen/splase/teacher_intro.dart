// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/utils/constimage.dart';

import '../../commonfun/customAnimation.dart';
import '../../commonfun/enums.dart';
import '../../config/sharedPrefs.dart';
import '../../utils/style.dart';
import '../otplogin/login_screen.dart';

class TeacherIntro extends StatefulWidget {
  const TeacherIntro({Key? key}) : super(key: key);

  @override
  State<TeacherIntro> createState() => _TeacherIntroState();
}

class _TeacherIntroState extends State<TeacherIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB87109),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetImages.teacherintroback),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAnimation(
                direction: Direction.up,
                duration: const Duration(milliseconds: 1500),
                child: Text(
                  "Advantage of Vida - To Teacher",
                  style: GoogleFonts.roboto(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomAnimation(
                direction: Direction.right,
                duration: const Duration(milliseconds: 500),
                child: mainHeadin(context,
                    "Get students in and around your preferred location"),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomAnimation(
                direction: Direction.right,
                duration: const Duration(milliseconds: 1000),
                child: mainHeadin(context,
                    "Get the full fees from the parents and no need to share it with anyone."),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomAnimation(
                direction: Direction.right,
                duration: const Duration(milliseconds: 1500),
                child: mainHeadin(context,
                    "We charge the lowest cost per lead as compared to our competitors."),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomAnimation(
                  direction: Direction.right,
                  duration: const Duration(seconds: 2),
                  child: mainHeadin(
                      context, "Get authentic and genuine parents number")),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.teacherintroback),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () async {
                  final prefe = UserPrefs();

                  await prefe.setData("tintro", "yes");

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen(
                                uid: 2,
                              )));
                },
                child: Text(
                  "Skip",
                  style: style16w400w,
                ))
          ],
        ),
      ),
    );
  }

  Widget mainHeadin(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AssetImages.point),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 90,
          child: Text(
            text,
            style: style16w400w,
          ),
        )
      ],
    );
  }
}
