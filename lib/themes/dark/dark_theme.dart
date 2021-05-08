import 'package:bike_store_admin_flutter/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getDarkTheme(BuildContext context) => ThemeData.dark().copyWith(
  scaffoldBackgroundColor: darkBackgroundColor,
  textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      .apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
  canvasColor: secondaryColor,
);