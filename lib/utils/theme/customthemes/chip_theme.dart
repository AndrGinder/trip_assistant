import 'package:flutter/material.dart';

class TripAssistantChipTheme{
  TripAssistantChipTheme._();

  static ChipThemeData light
    = ChipThemeData(
      disabledColor: Colors.grey.withAlpha(DateTime.daysPerWeek),
      labelStyle: const TextStyle(color: Colors.blueGrey),
      selectedColor: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      checkmarkColor: Colors.white,
    );

  static ChipThemeData dark
    = ChipThemeData(
      disabledColor: Colors.grey.withAlpha(DateTime.daysPerWeek),
      labelStyle: const TextStyle(color: Colors.white),
      selectedColor: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      checkmarkColor: Colors.white,
    );
}