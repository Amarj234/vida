import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vida/utils/color.dart';

class CostomSnackbar {
  static show(BuildContext context, String txt, {Color color = AppColor.main}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        //padding: EdgeInsets.only(top: 50),
        backgroundColor: color,
        content: Text(txt),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10,
        ),
      ),
    );
  }
}
