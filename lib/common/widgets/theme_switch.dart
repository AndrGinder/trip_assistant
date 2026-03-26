import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_assistant/utils/theme/controller.dart';

class ThemeSwitch extends StatelessWidget{
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, controller, _) {
        return IconButton(
          icon: Icon(
            controller.isDark 
              ? Icons.dark_mode 
              : Icons.light_mode
          ),
          onPressed: controller.toggleTheme,
        );
      },
    );
  }
}