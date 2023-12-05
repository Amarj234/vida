import 'package:flutter/material.dart';
import 'package:vida/utils/constimage.dart';

import 'butto.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key, required this.txt, this.myfun})
      : super(key: key);
  final String txt;
  final Function()? myfun;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width - 36,
      height: 226,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(AssetImages.subsbackground), fit: BoxFit.fill)),
      child: Column(
        children: [
          const Text(
            "Your Total Balance",
            style: TextStyle(
                fontFamily: "Onest",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                txt,
                style: const TextStyle(
                    fontFamily: "Onest",
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(onTap: myfun, child: appButton("Pay NOW", context)),
        ],
      ),
    );
  }
}
