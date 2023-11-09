import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:vida/utils/color.dart';
import '../commonWidget/main_appbar.dart';
import '../menu/side_menu.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: "Notification",
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: index / 2 == 2 ? AppColor.textoreng2 : Colors.white,
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                        Color(0xffF5A925),
                        Color(0xffED6237),
                      ]),
                      width: .5,
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: ListTile(
                        trailing: Text(
                          "$index days ago",
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff9B9B9B)),
                        ),
                        title: Text(
                          maxLines: 1,
                          "A parent has recently view your contact ",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.main),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        maxLines: 1,
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff707070)),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
