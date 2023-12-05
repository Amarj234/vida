import 'package:flutter/material.dart';
import 'package:flutterme_credit_card/flutterme_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/screen/subscribe/widget/radio_button.dart';
import 'package:vida/utils/color.dart';
import '../../commonfun/tab_provider.dart';
import '../../utils/constimage.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/costum_snackbar.dart';
import '../selectlocation/provider/tabprovider.dart';
import 'provider/subscribe_provider.dart';

class SubscribePay extends StatefulWidget {
  const SubscribePay({Key? key}) : super(key: key);

  @override
  State<SubscribePay> createState() => _SubscribePayState();
}

class _SubscribePayState extends State<SubscribePay> {
  TabProvider? tabProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabProvider = Provider.of<TabProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appbarcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0, left: 18, right: 18),
          child: Consumer2<HometabProvider, SubscribeProvider>(
            builder: (context, provider, stud, child) {
              return stud.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff5D1934),
                            ),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "You will be charged ",
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                          text:
                                              // provider.uid == 1
                                              //     ? " ₹300 "
                                              //     :
                                              " ₹400",
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.white,
                                          )),
                                      TextSpan(
                                        text:
                                            // provider.uid == 1
                                            //     ? " to view 3         "
                                            //     :
                                            " to view 4         ",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: provider.uid == 1
                                            ? "Teacher's phone Numbers"
                                            : "Student's phone Numbers",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ])),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Select Payment Mode",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: const Color(0xff9A5A74))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                const RadeoButton(
                                  txt: 'Credit or debit card',
                                  isselect: 1,
                                  val: 20,
                                ),
                                const SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Form(
                                    // key: formKey,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff9A5A74))),
                                          child: FMHolderField(
                                            // controller: holder,
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              hintStyle: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff9A5A74)),
                                              errorBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 12),
                                              //labelText: "Card Holder Name",
                                              hintText: "Card Holder Name",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff9A5A74))),
                                          child: FMNumberField(
                                            //controller: number,
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              hintStyle: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff9A5A74)),
                                              errorBorder: InputBorder.none,

                                              focusedBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                              enabledBorder: InputBorder.none,

                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 12),
                                              //labelText: "Card Holder Name",
                                              hintText: "Card Number",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff9A5A74))),
                                                child: FMValidThruField(
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                  //    controller: validThru,
                                                  cursorColor: Colors.white,
                                                  decoration: InputDecoration(
                                                    hintStyle:
                                                        GoogleFonts.roboto(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xff9A5A74)),
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 12),
                                                    //labelText: "Card Holder Name",
                                                    hintText: "Expiry Date",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Flexible(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff9A5A74))),
                                                child: FMCvvField(
                                                  // controller: cvv,
                                                  cursorColor: Colors.white,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                    hintStyle:
                                                        GoogleFonts.roboto(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xff9A5A74)),
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 12),
                                                    //labelText: "Card Holder Name",
                                                    hintText: "CVV",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                InkWell(
                                  overlayColor:
                                      MaterialStateProperty.all(AppColor.main),
                                  onTap: () {
                                    provider.saveCard();
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        margin: const EdgeInsets.only(left: 20),
                                        decoration: BoxDecoration(
                                            color: AppColor.oreng,
                                            border: Border.all(
                                                color: provider.issavecard
                                                    ? AppColor.oreng
                                                    : Colors.black)),
                                        child: provider.issavecard
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Image.asset(
                                                    AssetImages.right),
                                              )
                                            : Container(),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Save this card for future transaction",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff9A5A74)),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  color: const Color(0xff9A5A74),
                                  width: double.infinity,
                                  height: 1,
                                ),
                                const SizedBox(height: 20),
                                const RadeoButton(
                                  val: 20,
                                  txt: 'Net Banking',
                                  isselect: 2,
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  color: const Color(0xff9A5A74),
                                  width: double.infinity,
                                  height: 1,
                                ),
                                const SizedBox(height: 20),
                                const RadeoButton(
                                  txt: 'Phone Pay / Google Pay',
                                  isselect: 3,
                                  val: 20,
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  color: const Color(0xff9A5A74),
                                  width: double.infinity,
                                  height: 1,
                                ),
                                const SizedBox(height: 20),
                                const RadeoButton(
                                  txt: 'Cash ON',
                                  isselect: 4,
                                  val: 20,
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  color: const Color(0xff9A5A74),
                                  width: double.infinity,
                                  height: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                provider.uid == 1
                                    ? "Total: ₹ 300 +GST "
                                    : "Total: ₹ 400 +GST ",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          AppButton(
                            texcolor: const Color(0xff421200),
                            hight: 36,
                            txt: 'PROCEED TO PAY',
                            col: AppColor.buttoncolor,
                            myfun: () {
                              if (tabProvider!.selectradeo == 4) {
                                stud.payAmount(context);
                              } else {
                                CostomSnackbar.show(
                                    context, "Please Select Cash Option");
                              }
                            },
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
