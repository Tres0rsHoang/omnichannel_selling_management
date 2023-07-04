import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:selling_management/blocs/intro/intro_bloc.dart';
import 'package:selling_management/screens/Intro/intro.dart';
import 'package:selling_management/screens/homePage/home_screen.dart';
import 'package:selling_management/themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
          supportedLocales: const [Locale('vi')],
          path: "lib/assets/translations",
          fallbackLocale: const Locale('vi'),
          child: const MyApp()
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return BlocProvider(
      create: (context) => IntroBloc(),
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        title: 'Omnichannel Management',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        home:  HomeScreen(),
      ),
    );
  }
}
