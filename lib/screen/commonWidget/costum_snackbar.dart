import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vida/utils/color.dart';

class CostomSnackbar {
  static show(BuildContext context, String txt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.main,
        content: const Text('This is snackbar'),
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
