import 'package:flutter/material.dart';
import 'package:trip_assistant/utils/theme/customthemes/appbartheme.dart';
import 'package:trip_assistant/utils/theme/customthemes/bottomsheettheme.dart';
import 'package:trip_assistant/utils/theme/customthemes/checkboxtheme.dart';
import 'package:trip_assistant/utils/theme/customthemes/chiptheme.dart';
import 'package:trip_assistant/utils/theme/customthemes/elevatedbuttontheme.dart';
import 'package:trip_assistant/utils/theme/customthemes/floatingactionbuttontheme%20copy.dart';
import 'package:trip_assistant/utils/theme/customthemes/inputdecorationtheme.dart';
import 'package:trip_assistant/utils/theme/customthemes/outlinedbuttontheme.dart';
import 'package:trip_assistant/utils/theme/customthemes/texttheme.dart';

class TripAssistantTheme {
  TripAssistantTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TripAssistantTextTheme.light,
    elevatedButtonTheme: TripAssistantElevatedButtonTheme.light,
    appBarTheme: TripAssistantAppBarTheme.light,
    bottomSheetTheme: TripAssistantBootomSheetTheme.light,
    checkboxTheme: TripAssistantCheckboxTheme.light,
    chipTheme: TripAssistantChipTheme.light,
    inputDecorationTheme: TripAssistantInputDecorationTheme.light,
    outlinedButtonTheme: TripAssistantOutlinedButtonTheme.light,
    floatingActionButtonTheme: TripAssistantFloatingActionButtonTheme.light,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TripAssistantTextTheme.dark,
    elevatedButtonTheme: TripAssistantElevatedButtonTheme.dark,
    appBarTheme: TripAssistantAppBarTheme.dark,
    bottomSheetTheme: TripAssistantBootomSheetTheme.dark,
    checkboxTheme: TripAssistantCheckboxTheme.dark,
    chipTheme: TripAssistantChipTheme.dark,
    inputDecorationTheme: TripAssistantInputDecorationTheme.dark,
    outlinedButtonTheme: TripAssistantOutlinedButtonTheme.dark,
    floatingActionButtonTheme: TripAssistantFloatingActionButtonTheme.dark,
  );
}