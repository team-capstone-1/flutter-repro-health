import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color Style Guide
Color primary = const Color(0xFFEFF2F6);
Color primary200 = const Color(0xFF9398A5);
Color secondary = const Color(0xFF000000);

// Green
Color green50 = const Color(0xFFE8F9F6);
Color green100 = const Color(0xFFB7EDE2);
Color green200 = const Color(0xFF94E5D5);
Color green300 = const Color(0xFF64D9C1);
Color green400 = const Color(0xFF45D1B5);
Color green500 = const Color(0xFF17C6A3);
Color green600 = const Color(0xFF15B494);
Color green700 = const Color(0xFF108D74);
Color green800 = const Color(0xFF0D6D5A);
Color green900 = const Color(0xFF0A5344);

// Grey
Color grey10 = const Color(0xFFFBFBFB);
Color grey50 = const Color(0xFFE9E9E9);
Color grey100 = const Color(0xFFB9B9B9);
Color grey200 = const Color(0xFF989898);
Color grey300 = const Color(0xFF686868);
Color grey400 = const Color(0xFF4B4B4B);
Color grey500 = const Color(0xFF1E1E1E);
Color grey600 = const Color(0xFF1B1B1B);
Color grey700 = const Color(0xFF151515);
Color grey800 = const Color(0xFF111111);
Color grey900 = const Color(0xFF0D0D0D);

// Alert
Color negative = const Color(0xFFFC4547);
Color negative25 = const Color(0xFFFED0D1);
Color warning = const Color(0xFFFEA53F);
Color warning25 = const Color(0xFFFEE8CF);
Color link = const Color(0xFF3EAFFF);
Color link25 = const Color(0xFFCEEBFF);
Color positive = const Color(0xFF37C976);
Color positive25 = const Color(0xFFCDF1DC);

// Font Style Guide
// Regular
TextStyle regular8Negative = GoogleFonts.poppins(
  color: negative,
  fontSize: 8,
  fontWeight: FontWeight.w400,
);

TextStyle regular8Black = GoogleFonts.poppins(
  color: secondary,
  fontSize: 8,
  fontWeight: FontWeight.w400,
);

TextStyle regular10Grey200 = GoogleFonts.poppins(
  color: grey200,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle regular10Grey300 = GoogleFonts.poppins(
  color: grey300,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle regular10Grey400 = GoogleFonts.poppins(
  color: grey400,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle regular10Grey500 = GoogleFonts.poppins(
  color: grey500,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle regular10Green500 = GoogleFonts.poppins(
  color: green500,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle regular10Primary200 = GoogleFonts.poppins(
  color: primary200,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle regular12Grey300 = GoogleFonts.poppins(
  color: grey300,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle regular12Grey400 = GoogleFonts.poppins(
  color: grey400,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle regular12Grey500 = GoogleFonts.poppins(
  color: grey500,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle regular14Grey400 = GoogleFonts.poppins(
  color: grey400,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

TextStyle regular14Grey900 = GoogleFonts.poppins(
  color: grey900,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

// Medium
TextStyle medium10Black = GoogleFonts.poppins(
  color: secondary,
  fontSize: 10,
  fontWeight: FontWeight.w500,
);

TextStyle medium14Grey400 = GoogleFonts.poppins(
  color: grey400,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle medium14Grey500 = GoogleFonts.poppins(
  color: grey500,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle medium14Grey900 = GoogleFonts.poppins(
  color: grey900,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle medium16Grey500 = GoogleFonts.poppins(
  color: grey500,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

// Semibold
TextStyle semiBold12Primary = GoogleFonts.poppins(
  color: primary,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

TextStyle semiBold12Green500 = GoogleFonts.poppins(
  color: green500,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

TextStyle semiBold12Black = GoogleFonts.poppins(
  color: secondary,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

TextStyle semiBold14Black = GoogleFonts.poppins(
  color: secondary,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

TextStyle semiBold16Black = GoogleFonts.poppins(
  color: secondary,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle semiBold16Grey300 = GoogleFonts.poppins(
  color: grey300,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle semiBold16Green700 = GoogleFonts.poppins(
  color: green700,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle semiBold24Grey400 = GoogleFonts.poppins(
  color: grey400,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

TextStyle semiBold24Grey500 = GoogleFonts.poppins(
  color: grey500,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

// Bold
TextStyle bold24Grey500 = GoogleFonts.poppins(
  color: grey500,
  fontSize: 24,
  fontWeight: FontWeight.w700,
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
