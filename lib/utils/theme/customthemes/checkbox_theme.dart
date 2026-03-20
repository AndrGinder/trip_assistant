import 'package:flutter/material.dart';

class TripAssistantCheckboxTheme{
  TripAssistantCheckboxTheme._();

  static CheckboxThemeData light
    = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith(
        (state) {
          if(state.contains(WidgetState.selected)) {
            return Colors.white;
          } 

          else {
            return Colors.blueGrey;
          }
        }
      ),
      fillColor: WidgetStateColor.resolveWith(
        (state){
          if(state.contains(WidgetState.selected)) {
            return Colors.blueGrey;
          } 

          else {
            return Colors.transparent;
          }
        }
      )
    );

  static CheckboxThemeData dark
    = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith(
        (state) {
          if(state.contains(WidgetState.selected)) {
            return Colors.blueGrey;
          } 

          else {
            return Colors.white;
          }
        }
      ),
      fillColor: WidgetStateColor.resolveWith(
        (state){
          if(state.contains(WidgetState.selected)) {
            return Colors.white;
          } 

          else {
            return Colors.transparent;
          }
        }
      )
    );
}