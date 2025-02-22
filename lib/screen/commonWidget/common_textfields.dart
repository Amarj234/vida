import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';
import '../../commonfun/validations.dart';
import '../otplogin/provider/login_provider.dart';

class CommonTextFields extends StatelessWidget {
  const CommonTextFields({
    Key? key,
    required this.hint,
    this.tcolor = const Color(0xff421200),
    required this.mycon,
    required this.isvalid,
    this.inputFormatters,
    this.log,
  }) : super(key: key);
  final String hint;
  final int isvalid;
  final Color tcolor;
  final TextEditingController mycon;
  final List<TextInputFormatter>? inputFormatters;
  final LoginProvider? log;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 73,
      child: TextFormField(
        maxLength: 10,
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
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Mobile Number';
                        } else if (Validations().validatePhone(value) == false) {
                          return 'Please Enter a Valid Mobile Number';
                        }
                        return null;
                      }
                    : (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter $hint';
                        }
                        return null;
                      },
        style: TextStyle(fontSize: 16.0, color: tcolor),
        decoration: InputDecoration(
            counterText: "",
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.only(top: 1, bottom: 1, left: 10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppColor.oreng.withOpacity(.8),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppColor.oreng.withOpacity(.8),
              ),
            ),
            helperStyle: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            errorStyle: const TextStyle(color: AppColor.main),
            labelStyle: TextStyle(color: tcolor, fontSize: 16.0),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.oreng.withOpacity(.8),
                ),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
