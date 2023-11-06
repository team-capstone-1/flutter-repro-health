import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color App
Color button = const Color(0xff14C6A4);
Color title = const Color(0xff4B4B4B);
Color subtitle = const Color(0xff686868);

// text Style
TextStyle onBoardingTitle = GoogleFonts.poppins(
  color: subtitle,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);
TextStyle onBoardingSubtitle = GoogleFonts.poppins(
  color: title,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);
TextStyle titleText = GoogleFonts.poppins(
  color: title,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);
TextStyle subtitleText = GoogleFonts.poppins(
  color: subtitle,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);
TextStyle emailTitle = GoogleFonts.poppins(
  color: title,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
TextStyle signUp = GoogleFonts.poppins(
  color: button,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);
TextStyle signUpText = GoogleFonts.poppins(
  color: title,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

// app image Assets
Image onBoardingImage = Image.asset(
  'assets/onboarding.png',
  width: 249.56,
  height: 253.57,
);
Image otpImage = Image.asset(
  'assets/logo_otp.png',
  width: 227,
  height: 291.98,
);
Image lupaPasswordImage = Image.asset(
  'assets/lupa_password.png',
  width: 259.82,
  height: 215.67,
);
Image logoApp = Image.asset(
  'assets/logo_ReproHealt.png',
  width: 144,
  height: 153,
);
