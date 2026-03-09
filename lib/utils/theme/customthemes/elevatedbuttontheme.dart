import 'package:flutter/material.dart';

class TripAssistantElevatedButtonTheme{
  TripAssistantElevatedButtonTheme._();

  static ElevatedButtonThemeData light
    = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: Colors.blueGrey),
        padding: const EdgeInsets.symmetric(vertical: 10),
        textStyle: const TextStyle(
          fontSize: 16, 
          color: Colors.white, 
          fontWeight: FontWeight.w600
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), 
      ),
    );

  static ElevatedButtonThemeData dark
    = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.blueGrey,
        backgroundColor: Colors.white,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 10),
        textStyle: const TextStyle(
          fontSize: 16, 
          color: Colors.blueGrey, 
          fontWeight: FontWeight.w600
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), 
      ),
    ); 
}