import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/utils/color.dart';

import '../commonWidget/main_appbar.dart';
import '../menu/side_menu.dart';
import 'widget/balance_card.dart';

class MySubscription extends StatefulWidget {
  const MySubscription({Key? key}) : super(key: key);

  @override
  State<MySubscription> createState() => _MySubscriptionState();
}

class _MySubscriptionState extends State<MySubscription> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
        title: "My Subscription",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const BalanceCard(
                txt: '03',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your Subscription History",
                style: TextStyle(
                    fontFamily: "Onest",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColor.main),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Table(
                  border: TableBorder(
                      borderRadius: BorderRadius.circular(10),
                      horizontalInside: const BorderSide(
                          width: 2, color: Color(0xffFFF8F6), style: BorderStyle.solid)),
                  children: [
                    TableRow(children: [
                      tableHead("Date"),
                      tableHead("Amount"),
                      tableHead("Status"),
                      tableHead("Payment "),
                    ]),
                    for (int i = 0; i < 5; i++) ...[
                      TableRow(children: [
                        bodyHed("18-10-23", false),
                        bodyHed("₹350", false),
                        bodyHed("Paid", true),
                        bodyHed("Credit Card", false),
                      ]),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyHed(String txt, bool color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Text(
        txt,
        style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: color ? const Color(0xff54A700) : AppColor.main),
      ),
    );
  }

  Widget tableHead(String txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Text(
        txt,
        style: GoogleFonts.roboto(
            fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xffA3A3A3)),
      ),
    );
  }
}
