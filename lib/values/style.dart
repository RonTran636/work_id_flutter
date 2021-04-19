import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_id/constant/constant.dart';
import 'package:work_id/values/size_config.dart';

class Styles {
  static ElevatedButton defaultButton(
      String text, Color color, void Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)))),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: GoogleFonts.roboto(
              fontSize: getProportionateScreenWidth(mediumFontSize),
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
