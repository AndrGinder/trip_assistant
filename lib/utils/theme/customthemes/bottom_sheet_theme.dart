import 'package:flutter/material.dart';

class TripAssistantBootomSheetTheme{
  TripAssistantBootomSheetTheme._();

  static BottomSheetThemeData light
    = BottomSheetThemeData(
      showDragHandle: true,
      modalBackgroundColor: Colors.white,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );


  static BottomSheetThemeData dark
    = BottomSheetThemeData(
      showDragHandle: true,
      modalBackgroundColor: Colors.blueGrey,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
}