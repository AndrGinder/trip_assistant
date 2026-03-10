import 'package:flutter/material.dart';

class TripAssistantAppBarTheme{
  TripAssistantAppBarTheme._();

  static AppBarTheme light
    = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.blueGrey,
      surfaceTintColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white, 
        size: 24
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white, 
        size: 24
      ),
      titleTextStyle: TextStyle(
        fontSize: 18.0, 
        fontWeight: FontWeight.w600, 
        color: Colors.white
      ),
    );

  static AppBarTheme dark
    = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.blueGrey,
      surfaceTintColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white, 
        size: 24
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white, 
        size: 24
      ),
      titleTextStyle: TextStyle(
        fontSize: 18.0, 
        fontWeight: FontWeight.w600, 
        color: Colors.white
      ),
    );
}