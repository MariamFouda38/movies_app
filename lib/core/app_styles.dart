import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/colors_manager.dart';

class AppStyles {
  static TextStyle header = GoogleFonts.inter(fontSize: 15,
      fontWeight: FontWeight.w400,
      color: ColorsManager.header);

  static TextStyle search= GoogleFonts.inter(
  fontWeight: FontWeight.w400,
  fontSize: 12.0, color: Colors.white);

  static TextStyle mediumFont= GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 15.0, color: Colors.white);

  static TextStyle headline= GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 22.0, color: Colors.white);

}