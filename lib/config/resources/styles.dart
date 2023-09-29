import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();

  /// Regular
  static final boldText = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
  static final regularText = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static final mediumText = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  static final lightText = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
}
