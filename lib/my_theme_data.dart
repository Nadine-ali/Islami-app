import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class my_theme_data {
  static const Color primarygold = Color(0xffB7935F);
  static const Color primaryblack = Color(0xff242424);
  static const Color primaryyellow = Color(0xffFACC1D);
  static const Color primarydarkblue = Color(0xff141A2E);
  static ThemeData lighttheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primarygold,
      //table-----
      primary: primarygold,
      onPrimary: primaryblack,
      //bottom navbar-----
      onBackground: primarygold,
      secondary: Colors.white,
      onSecondary: primaryblack,
      //container
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        color: Colors.transparent,
        iconTheme: IconThemeData(color: primaryblack)),
    dividerTheme: DividerThemeData(color: primarygold),
    iconTheme: IconThemeData(color: primarygold),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
            color: primaryblack, fontSize: 30, fontWeight: FontWeight.w700),
        bodyMedium: GoogleFonts.elMessiri(
            color: primaryblack, fontSize: 25, fontWeight: FontWeight.w600),
        bodySmall: GoogleFonts.inter(
            color: primaryblack, fontSize: 20, fontWeight: FontWeight.w400)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primarygold,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: primaryblack,
      unselectedItemColor: Colors.white,
    ),
  );
  static ThemeData darktheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryyellow,
      //table-----
      primary: primaryyellow,
      onPrimary: Colors.white,
      //bottom navbar-----
      onBackground: primarydarkblue,
      secondary: Colors.white,
      onSecondary: primaryyellow,
      //container
      background: primarydarkblue,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: primaryyellow),
    ),
    dividerTheme: DividerThemeData(color: primaryyellow),
    iconTheme: IconThemeData(color: primaryyellow),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        bodyMedium: GoogleFonts.elMessiri(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        bodySmall: GoogleFonts.inter(
            color: primaryyellow, fontSize: 20, fontWeight: FontWeight.w400)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primarydarkblue,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: primaryyellow,
      unselectedItemColor: Colors.white,
    ),
  );
}
