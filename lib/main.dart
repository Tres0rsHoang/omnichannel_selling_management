
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:selling_management/blocs/intro_blocs/intro_bloc.dart';
import 'package:selling_management/blocs/order_blocs/order_bloc.dart';
import 'package:selling_management/blocs/product_blocs/product_bloc.dart';
import 'package:selling_management/blocs/themes_blocs/themes_bloc.dart';

import 'package:selling_management/screens/loading_screen/loading_screen.dart';
import 'package:selling_management/logger.dart';
import 'package:selling_management/screens/home_screen/home_screen.dart';
import 'package:selling_management/screens/order_screen/order_screen.dart';

import 'package:selling_management/themes/app_themes.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'screens/intro_screen/intro_screen.dart';

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
        BlocProvider<OrderBloc>(
          create: (BuildContext context) => OrderBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
      ],
      child: BlocBuilder<ThemesBloc, ThemesState>(
        builder: (context, state) {
          final themesBloc = BlocProvider.of<ThemesBloc>(context);
          themesBloc.add(InitialThemeEvent());

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Omnichannel Selling Management",
            themeMode: state.themeMode,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const LoadingScreen(),
          );
        },
      ),
    );
  }
}

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;
  // Add more screen here
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const OrderScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 4) {
      _openBottomSheetDialog();
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _openBottomSheetDialog() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          // Customize your bottom sheet content here
          child: Text('Fifth Item BottomSheetDialog'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: widgetOptions.asMap().containsKey(_currentIndex)
              ? widgetOptions[_currentIndex]
              : const HomeScreen(),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Tổng quan',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.newspaper),
                label: 'Đơn hàng',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.cartShopping),
                label: 'Sản phẩm',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.box),
                label: 'Kho',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.gripVertical),
                label: 'Thêm',
              ),
            ],
            unselectedItemColor: Colors.grey[500],
            selectedItemColor: Colors.blue[300],
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
          ),
        ),
      );
    });
  }
}
