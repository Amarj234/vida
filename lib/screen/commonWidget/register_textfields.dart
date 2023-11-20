import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:vida/utils/constimage.dart';

import '../../commonfun/validations.dart';
import '../../utils/color.dart';

class RegisterTextfields extends StatelessWidget {
  const RegisterTextfields(
      {Key? key,
      required this.hint,
      required this.isvalid,
      required this.tcolor,
      required this.mycon,
      this.inputFormatters,
      this.icon,
      this.isicon = false,
      this.readonly = false,
      this.myfun})
      : super(key: key);
  final String hint;
  final int isvalid;
  final bool isicon;
  final bool readonly;
  final String? icon;
  final Function()? myfun;
  final Color tcolor;
  final TextEditingController mycon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              //color: provider.tabval.contains(val) ? Colors.white : AppColor.appbackground2,
              // border: Border.all(color: AppColor.oreng.withOpacity(.5)),
              border: const GradientBoxBorder(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffF5A925),
                      Color(0xffe06f4c),
                    ]),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          // height: 45,
          child: TextFormField(
            onTap: myfun,
            readOnly: readonly,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: mycon,
            style: GoogleFonts.roboto(
              color: AppColor.main,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
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
                              return 'Please enter Phone';
                            } else if (Validations().validatePhone(value) == false) {
                              return 'Please enter valid Phone';
                            }
                            return null;
                          }
                        : (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter $hint';
                            }
                            return null;
                          },
            decoration: InputDecoration(
              suffixIcon: isicon
                  ? icon == null
                      ? Image.asset(AssetImages.location)
                      : Image.asset(
                          icon!,
                          height: 15,
                          width: 15,
                        )
                  : Container(
                      width: 1,
                    ),
              //fillColor: Colors.white,
              // filled: true,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedErrorBorder: const UnderlineInputBorder(
                  // borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(width: 1, color: Color(0xffED6237))),
              errorBorder: const UnderlineInputBorder(
                  //  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(width: 1, color: Color(0xffED6237))),
              contentPadding: const EdgeInsets.only(top: 14, bottom: 1, left: 15),

              labelStyle: TextStyle(color: tcolor, fontSize: 16.0),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
