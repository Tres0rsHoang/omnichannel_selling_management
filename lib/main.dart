import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selling_management/blocs/intro/intro_bloc.dart';
import 'package:selling_management/blocs/intro/intro_event.dart';
import 'package:selling_management/blocs/intro/intro_state.dart';
import 'package:selling_management/screens/Intro/Intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Intro(),
      ),
    );
  }
}
