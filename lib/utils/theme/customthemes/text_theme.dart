import 'package:flutter/material.dart';

class TripAssistantTextTheme{
  TripAssistantTextTheme._();

  static TextTheme light
    = TextTheme(
      headlineLarge: TextStyle()
        .copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey
        ),
      headlineMedium: TextStyle()
        .copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.blueGrey
        ),
      headlineSmall: TextStyle()
        .copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey
        ),
    ); 

  static TextTheme dark
    = TextTheme(
      headlineLarge: TextStyle()
        .copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      headlineMedium: TextStyle()
        .copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),
      headlineSmall: TextStyle()
        .copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white
        ),
    ); 
}