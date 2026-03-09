import 'package:flutter/material.dart';

class TripAssistantOutlinedButtonTheme{
  TripAssistantOutlinedButtonTheme._();

  static OutlinedButtonThemeData light
    = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.blueGrey,
        side: const BorderSide(color: Colors.blueGrey),
        textStyle: const TextStyle(
          fontSize: 16, 
          color: Colors.white, 
          fontWeight: FontWeight.w600
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16, 
          horizontal: 20
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), 
      ),
    );

  static OutlinedButtonThemeData dark
    = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white),
        textStyle: const TextStyle(
          fontSize: 16, 
          color: Colors.blueGrey, 
          fontWeight: FontWeight.w600
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16, 
          horizontal: 20
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), 
      ),
    );
}