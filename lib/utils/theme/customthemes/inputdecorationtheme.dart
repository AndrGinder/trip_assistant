import 'package:flutter/material.dart';

class TripAssistantInputDecorationTheme{
  TripAssistantInputDecorationTheme._();

  static InputDecorationTheme light
    = InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: const TextStyle()
        .copyWith(
          fontSize: 14, 
          color: Colors.blueGrey
        ),
      hintStyle: const TextStyle()
        .copyWith(
          fontSize: 14, 
          color: Colors.blueGrey
        ),
      errorStyle: const TextStyle()
        .copyWith(
          fontStyle: FontStyle.normal, 
          color: Colors.red,
        ),
      floatingLabelStyle: const TextStyle()
        .copyWith(
          color: Colors.blueGrey
            .withAlpha(DateTime.daysPerWeek)
        ),
      border: const OutlineInputBorder()
        .copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1, 
            color: Colors.grey
          ),
        ),
      enabledBorder: const OutlineInputBorder()
        .copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1, 
            color: Colors.grey
          ),
        ),
      focusedBorder: const OutlineInputBorder()
        .copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1, 
            color: Colors.blueGrey
          ),
        ),
      errorBorder: const OutlineInputBorder()
        .copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1, 
            color: Colors.red
          ),
        ),
      focusedErrorBorder: const OutlineInputBorder()
        .copyWith(
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
      labelStyle: const TextStyle()
        .copyWith(
          fontSize: 14, 
          color: Colors.white
        ),
      hintStyle: const TextStyle()
        .copyWith(
          fontSize: 14, 
          color: Colors.white
        ),
      errorStyle: const TextStyle()
        .copyWith(
          fontStyle: FontStyle.normal, 
          color: Colors.red,
        ),
      floatingLabelStyle: const TextStyle()
        .copyWith(
          color: Colors.white
            .withAlpha(DateTime.daysPerWeek)
        ),
      border: const OutlineInputBorder()
        .copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1, 
            color: Colors.grey
          ),
        ),
      enabledBorder: const OutlineInputBorder()
        .copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1, 
            color: Colors.grey
          ),
        ),
      focusedBorder: const OutlineInputBorder()
        .copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1, 
            color: Colors.white
          ),
        ),
      errorBorder: const OutlineInputBorder()
        .copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1, 
            color: Colors.red
          ),
        ),
      focusedErrorBorder: const OutlineInputBorder()
        .copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1, 
            color: Colors.redAccent
          ),
        ),
    );
}