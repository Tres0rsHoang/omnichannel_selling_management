
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/screens/intro_screen/intro_screen.dart';

class LoadingScreen extends StatefulWidget{
  const LoadingScreen({super.key});
  @override
  State<StatefulWidget> createState() => LoadingState();
}

class LoadingState extends State<LoadingScreen>{

  Future<void> loadingData() async {
    await Future.delayed(const Duration(seconds: 5));

    //Push getting data here

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const IntroScreen()
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    loadingData();

    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Transform.translate(
                    offset: const Offset(-80, -80),
                    child: Transform.scale(
                      scale: 1.2,
                      child: Container(
                          height: 400,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment(1, 1),
                              colors: <Color>[
                                Color(0xffffffff),
                                Color(0xff1973E5),
                              ],
                              tileMode: TileMode.mirror,
                            ),
                            shape: BoxShape.circle,
                          )
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Transform.translate(
                    offset: const Offset(50, -50),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment(1, 1),
                          colors: <Color>[
                            Color(0xffffffff),
                            Color(0xff1973E5),
                          ],
                          tileMode: TileMode.mirror,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(bottom: 80) ,child: Image.asset('lib/assets/images/full_logo.jpg')),
              const Center(child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}