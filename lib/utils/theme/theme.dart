import 'package:flutter/material.dart';
import 'package:trip_assistant/utils/theme/customthemes/app_bar_theme.dart';
import 'package:trip_assistant/utils/theme/customthemes/bottom_sheet_theme.dart';
import 'package:trip_assistant/utils/theme/customthemes/checkbox_theme.dart';
import 'package:trip_assistant/utils/theme/customthemes/chip_theme.dart';
import 'package:trip_assistant/utils/theme/customthemes/elevated_button_theme.dart';
import 'package:trip_assistant/utils/theme/customthemes/floating_action_button_theme.dart';
import 'package:trip_assistant/utils/theme/customthemes/input_decoration_theme.dart';
import 'package:trip_assistant/utils/theme/customthemes/outlined_button_theme.dart';
import 'package:trip_assistant/utils/theme/customthemes/text_theme.dart';

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