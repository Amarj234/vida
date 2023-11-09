import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/style.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.main,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        "View Contact",
        style: style12w400w,
      ),
    );
  }
}
