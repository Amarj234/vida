import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/utils/color.dart';
import 'package:vida/utils/constimage.dart';

import '../commonWidget/main_appbar.dart';
import '../commonWidget/register_textfields.dart';
import '../menu/side_menu.dart';
import 'widget/button_icon.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F6),
      key: scaffoldKey,
      endDrawer: const SideMenu(),
      appBar: MainAppbar(
        ontap: () {
          if (scaffoldKey.currentState!.isEndDrawerOpen) {
            scaffoldKey.currentState!.closeEndDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openEndDrawer();
            //open drawer, if drawer is closed
          }
        },
        leading: true,
        context: context,
        title: "Support",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              RegisterTextfields(
                icon: AssetImages.search,
                isicon: true,
                isvalid: 0,
                mycon: search,
                tcolor: const Color(0xffA3A3A3),
                hint: 'How can we help you',
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Help and Support service hour",
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.main),
              ),
              const SizedBox(
                height: 20,
              ),
              pointText("Mon - Fri: 8:00 AM - 6:00 PM"),
              pointText("Sat - Sun: 8:00 AM - 4:00 PM"),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Didn’t find the answer to your questions?",
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.main),
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonIcon(
                image: AssetImages.email,
                heigth: 36,
                txt: "Email us    ",
                myfun: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonIcon(
                image: AssetImages.call,
                heigth: 36,
                txt: "Call us        ",
                myfun: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonIcon(
                image: AssetImages.msg,
                heigth: 36,
                txt: "Message us",
                myfun: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Your feedback is invaluable for us. It help us improve our app and services.",
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xff333333)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pointText(String txt) {
    return Row(
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.main),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            txt,
            style:
                GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.main),
          ),
        ),
      ],
    );
  }
}
