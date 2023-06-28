import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

final brightnesss = SchedulerBinding.instance.window.platformBrightness;

class AppThemes {
  static final lightTheme = ThemeData(
    backgroundColor: const Color(0xFFFFFFFF),
    colorScheme: const ColorScheme.light(),
    primaryColor: const Color(0xFF0F1317),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      labelMedium: TextStyle(color: Color(0xFF666666)),
    ),
  );

  static final darkTheme = ThemeData(
    backgroundColor: Colors.blue,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.grey,
  );
}

extension CustomColorScheme on ColorScheme {
  Color get lightGrey => const Color(0xFFACACAC);
}
