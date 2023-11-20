import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vida/commonfun/tab_provider.dart';
import 'package:vida/screen/subscribe/mysubscription.dart';
import 'package:vida/utils/constimage.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';
import '../home_screen.dart';
import '../notification/notification.dart';
import '../support/support_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: MediaQuery.of(context).size.height,
      backgroundColor: AppColor.radiocolr,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
          ),
          child: Consumer<HometabProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menuitem("Home", () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                                  index: 0,
                                )));
                  }),
                  menuitem("Profile", () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                                  index: 2,
                                )));
                  }),
                  menuitem("My Subscription", () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const MySubscription()));
                  }),
                  menuitem(provider.uid == 1 ? "My Enquiry" : "My Lead", () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                                  index: 1,
                                )));
                  }),
                  menuitem("Support", () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const SupportScreen()));
                  }),
                  menuitem("Notification", () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const NotificationScreen()));
                  }),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetImages.logout,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Logout",
                          style: style18w400w,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget menuitem(String txt, Function() myfun) {
    return InkWell(
      onTap: myfun,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xffE96D3C),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
            child: Text(
              txt,
              style: style18w400w,
            ),
          ),
          txt == "Notification"
              ? Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffE96D3C),
                )
              : Container(),
        ],
      ),
    );
  }
}
