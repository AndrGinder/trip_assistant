import 'package:flutter/material.dart';

class TripAssistantFloatingActionButtonTheme{
  TripAssistantFloatingActionButtonTheme._();

  static FloatingActionButtonThemeData light
    = FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      focusColor: Colors.green,
      hoverColor: Colors.blueGrey.shade300,
      splashColor: Colors.blueGrey.shade200,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    );

  static FloatingActionButtonThemeData dark
    = FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      focusColor: Colors.green,
      hoverColor: Colors.blueGrey.shade600,
      splashColor: Colors.blueGrey.shade700,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    );
}