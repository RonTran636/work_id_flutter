import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_id/values/size_config.dart';
import 'package:work_id/constant/constant.dart';

class Styles {
  static ElevatedButton defaultButton(
      String text, Color color, Function onPressed) {
    return ElevatedButton(
      onPressed:() => onPressed,
      style: ElevatedButton.styleFrom(primary: color),
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
