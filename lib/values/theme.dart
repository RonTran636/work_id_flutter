import '../constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: kPrimaryColor),
        gapPadding: 12);
    return InputDecorationTheme(
        labelStyle: GoogleFonts.roboto(
            color: kPrimaryColor,
            fontSize: mediumFontSize,
            fontWeight: FontWeight.normal),
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder);
  }
}
