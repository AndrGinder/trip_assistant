import 'package:flutter/material.dart';

class TripAssistantInputDecorationTheme{
  TripAssistantInputDecorationTheme._();

  static InputDecorationTheme light
    = InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: Colors.blueGrey,
      suffixIconColor: Colors.blueGrey,
      labelStyle: const TextStyle(
        fontSize: 14, 
        color: Colors.blueGrey
      ),
      hintStyle: const TextStyle(
        fontSize: 14, 
        color: Colors.blueGrey
      ),
      errorStyle: TextStyle(
        fontStyle: FontStyle.normal, 
        color: Colors.red,
      ),
      floatingLabelStyle: TextStyle(
        color: Colors.blueGrey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1, 
          color: Colors.grey
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1, 
          color: Colors.grey
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1, 
          color: Colors.blueGrey
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1, 
          color: Colors.red
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1, 
          color: Colors.redAccent
        ),
      ),
    );

  static InputDecorationTheme dark
    = InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: TextStyle(
        fontSize: 14, 
        color: Colors.blueGrey
      ),
      hintStyle: TextStyle(
        fontSize: 14, 
        color: Colors.blueGrey
      ),
      errorStyle: TextStyle(
        fontStyle: FontStyle.normal, 
        color: Colors.red,
      ),
      floatingLabelStyle: TextStyle(
        color: Colors.blueGrey
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          width: 1, 
          color: Colors.grey
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1, 
          color: Colors.grey
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1, 
          color: Colors.white
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1, 
          color: Colors.red
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1, 
          color: Colors.redAccent
        ),
      ),
    );
}