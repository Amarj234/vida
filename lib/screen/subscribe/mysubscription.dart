import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/screen/subscribe/provider/subscribe_provider.dart';
import 'package:vida/screen/subscribe/subscribe_pay.dart';
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

  SubscribeProvider? subscribeProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscribeProvider = Provider.of<SubscribeProvider>(context, listen: false);
    subscribeProvider!.getlist(context);
    subscribeProvider!.getBalance(context);
  }

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
        title: "My Payments",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Consumer<SubscribeProvider>(
            builder: (context, provider, child) {
              return provider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          BalanceCard(
                            myfun: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SubscribePay()));
                            },
                            txt: provider.yourBalance!.d.data.numberOfView
                                    .toString() ??
                                "",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Your Payment History",
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
                            child: provider.paymentHistory == null
                                ? Center(
                                    child: Text("Payment History Empty"),
                                  )
                                : provider.paymentHistory!.data.isEmpty
                                    ? Center(
                                        child: Text("Payment History Empty"),
                                      )
                                    : Table(
                                        border: TableBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            horizontalInside: const BorderSide(
                                                width: 2,
                                                color: Color(0xffFFF8F6),
                                                style: BorderStyle.solid)),
                                        children: [
                                          TableRow(children: [
                                            tableHead("Date"),
                                            tableHead("Amount"),
                                            tableHead("Status"),
                                            tableHead("Payment "),
                                          ]),
                                          for (int i = 0;
                                              i <
                                                  provider.paymentHistory!.data
                                                      .length;
                                              i++) ...[
                                            TableRow(children: [
                                              bodyHed(
                                                  provider.formateDate(provider
                                                      .paymentHistory!
                                                      .data[i]
                                                      .createdAt
                                                      .toString()),
                                                  false),
                                              bodyHed(
                                                  provider
                                                          .paymentHistory!
                                                          .data[i]
                                                          .totalAmount ??
                                                      "",
                                                  false),
                                              bodyHed("Paid", true),
                                              bodyHed(
                                                  provider
                                                              .paymentHistory!
                                                              .data[i]
                                                              .modeOfPayment ==
                                                          1
                                                      ? "Cash"
                                                      : "Credit Card",
                                                  false),
                                            ]),
                                          ]
                                        ],
                                      ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    );
            },
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
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xffA3A3A3)),
      ),
    );
  }
}
