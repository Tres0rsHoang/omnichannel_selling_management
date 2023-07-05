import "dart:io";

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:selling_management/blocs/intro_blocs/intro_bloc.dart';
import 'package:selling_management/blocs/order_blocs/order_bloc.dart';
import 'package:selling_management/blocs/themes_blocs/themes_bloc.dart';
import 'package:selling_management/screens/home_screen/home_screen.dart';
import 'package:selling_management/screens/notify_screen/notify.dart';
import 'package:selling_management/screens/order_screen/order_screen.dart';

import 'package:selling_management/themes/app_themes.dart';
import "package:shared_preferences/shared_preferences.dart";

import 'screens/intro_screen/intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Locale currentLocale = Locale("vi");
  final prefs = await SharedPreferences.getInstance();
  final String? currentLanguageStorage = prefs.getString("language");
  final String? currentThemeStorage = prefs.getString("theme");

  //always light theme
  prefs.setString("theme", "light");

  /*if (currentLanguageStorage != null) {
    currentLocale = Locale(currentLanguageStorage);
  }
  else {
    final defaultLanguage = Platform.localeName.substring(0, 2);
    currentLocale = Locale(defaultLanguage);
  }*/

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('vi')],
        path: "lib/assets/translations",
        fallbackLocale: currentLocale,
        child: MyApp(themeStorage: currentThemeStorage)),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.themeStorage}) : super(key: key);
  final String? themeStorage;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemesBloc>(
          create: (BuildContext context) => ThemesBloc(),
        ),
        BlocProvider<IntroBloc>(
          create: (BuildContext context) => IntroBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => OrderBloc(),
        )
      ],
      child: BlocBuilder<ThemesBloc, ThemesState>(
        builder: (context, state) {
          final themesBloc = BlocProvider.of<ThemesBloc>(context);
          themesBloc.add(InitialThemeEvent());

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Flutter Omnichannel",
            themeMode: state.themeMode,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home:  HomeScreen(),
          );
        },

      ),
    );
  }
}
