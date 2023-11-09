import 'package:flutter/material.dart';

import '../../../utils/color.dart';

Widget appButton(String txt, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 2,
    decoration: BoxDecoration(color: AppColor.main, borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt,
            style: const TextStyle(
                fontFamily: "Onest",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
