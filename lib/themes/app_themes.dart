import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

final brightnesss = SchedulerBinding.instance.window.platformBrightness;

class AppThemes {
  static final lightTheme = ThemeData(
    backgroundColor: const Color(0xFFFFFFFF),
    colorScheme: const ColorScheme.light(),
    primaryColor: const Color(0xFF1F72DD),
    secondaryHeaderColor: const Color(0xF7FAFD),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      labelMedium: TextStyle(color: Color(0xFF666666)),
      labelLarge: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:const Color(0xFF1F72DD),
        textStyle: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontFamily: 'Roboto'
        )
      )
    )
  );

  static final darkTheme = ThemeData(
    backgroundColor: Colors.blue,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.grey,
  );
}

extension CustomColorScheme on ColorScheme {
  Color get lightGrey => const Color(0xFFACACAC);
  Color get bodyHomeColor => Color.fromARGB(0, 231, 237, 244);
}
