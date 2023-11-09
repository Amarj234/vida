import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:vida/utils/constimage.dart';

import '../../commonfun/validations.dart';

class TextArea extends StatelessWidget {
  const TextArea(
      {Key? key,
      required this.hint,
      required this.isvalid,
      required this.tcolor,
      required this.mycon,
      this.inputFormatters,
      this.isicon = false})
      : super(key: key);
  final String hint;
  final int isvalid;
  final bool isicon;
  final Color tcolor;
  final TextEditingController mycon;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          //color: provider.tabval.contains(val) ? Colors.white : AppColor.appbackground2,
          // border: Border.all(color: AppColor.oreng.withOpacity(.5)),
          border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [
              Color(0xffF5A925),
              Color(0xffED6237),
            ]),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10)),
      // height: 45,
      child: TextFormField(
        maxLines: 5,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: mycon,
        keyboardType: isvalid == 1
            ? TextInputType.emailAddress
            : isvalid == 2
                ? TextInputType.number
                : TextInputType.text,
        inputFormatters: inputFormatters,
        validator: isvalid == 0
            ? (v) {
                return null;
              }
            : isvalid == 1
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    } else if (Validations().isValidEmail(value) == false) {
                      return 'Please enter valid Email';
                    }
                    return null;
                  }
                : isvalid == 2
                    ? (value) {
                        // if (value == null || value.isEmpty) {
                        //   return 'Please enter Email';
                        // } else if (Validations().validatePhone(value!) == false) {
                        //   return 'Please enter valid Email';
                        // }
                        return null;
                      }
                    : (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter $hint';
                        }
                        return null;
                      },
        style: TextStyle(fontSize: 16.0, color: tcolor),
        decoration: InputDecoration(
          suffixIcon: isicon
              ? Image.asset(AssetImages.location)
              : Container(
                  width: 1,
                ),
          //fillColor: Colors.white,
          // filled: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14, bottom: 1, left: 15),

          labelStyle: TextStyle(color: tcolor, fontSize: 16.0),
          hintText: hint,
        ),
      ),
    );
  }
}
