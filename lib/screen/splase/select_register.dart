import 'package:flutter/material.dart';
import 'package:vida/utils/color.dart';
import 'package:vida/utils/constimage.dart';

import '../../utils/style.dart';
import 'intro_screen.dart';
import 'widget/container_btn.dart';

class SelectRegister extends StatefulWidget {
  const SelectRegister({Key? key}) : super(key: key);

  @override
  State<SelectRegister> createState() => _SelectRegisterState();
}

class _SelectRegisterState extends State<SelectRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appbackground,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 13, left: 25, right: 25),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetImages.vida,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Education is the process of acquiring knowledge, skills, values, and habits. It is a lifelong journey that typically begins in childhood and continues throughout one's life.",
                      style: style16w400,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  color: AppColor.main,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.main.withOpacity(.1),
                      //blurRadius: 5,
                      spreadRadius: 12,
                    ),
                    BoxShadow(
                      color: AppColor.main.withOpacity(.3),
                      //blurRadius: 5,
                      spreadRadius: 6,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Register As",
                        style: style24w400w,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ContainerBtn(
                        myfun: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const IntroScreen()));
                        },
                        text: 'PARENT',
                        image: AssetImages.perent,
                        col: AppColor.yello,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ContainerBtn(
                        myfun: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const IntroScreen()));
                        },
                        text: 'TEACHER',
                        image: AssetImages.teacher,
                        col: AppColor.oreng,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetImages.trident,
                            height: 130,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
