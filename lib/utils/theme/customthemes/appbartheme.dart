import 'package:flutter/material.dart';

class TripAssistantAppBarTheme{
  TripAssistantAppBarTheme._();

  static AppBarTheme light
    = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.blueGrey, 
        size: 24
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.blueGrey, 
        size: 24
      ),
      titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.blueGrey),
    );

  static AppBarTheme dark
    = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.white, 
        size: 24
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white, 
        size: 24
      ),
      titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    );
}