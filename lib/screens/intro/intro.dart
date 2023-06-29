import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selling_management/blocs/intro/intro_bloc.dart';
import 'package:selling_management/blocs/intro/intro_event.dart';
import 'package:selling_management/blocs/intro/intro_state.dart';
import 'package:selling_management/constants/image_assets.dart';

import '../../constants/key_translate.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});
  @override
  Widget build(BuildContext context) {

    var introPic = [INTRO_PIC_1, INTRO_PIC_2, INTRO_PIC_3];
    var intro = [INTRO_1, INTRO_2, INTRO_3];
    var introDot = [INTRO_DOT_3, INTRO_DOT_2, INTRO_DOT_3];
    bool direction = false;

    return Scaffold(
<<<<<<< Updated upstream
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 45),
                  child: Image.asset(FULL_LOGO)),
              Image.asset(INTRO_PIC),
              Text(
                INTRO_1.tr(),
                style: TextStyle(
                    color: Theme.of(context).textTheme.labelMedium?.color,
                    fontSize: 15),
                textAlign: TextAlign.center,
              ),
              Image.asset(INTRO_DOT),
              Text(HELLO.tr()),
              Text(READYMANAGEMENT.tr()),
              TextButton(onPressed: () {}, child: Text(LOGIN.tr())),
              Text(ACCESSWEBSITE.tr()),
            ]));
=======
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Container(
              margin: const EdgeInsets.only(top: 110),
              child: Image.asset(
                  FULL_LOGO
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 0),
                  child: Image.asset(introPic[BlocProvider.of<IntroBloc>(context).state.counter]),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child:Text(
                    intro[BlocProvider.of<IntroBloc>(context).state.counter],
                    style: TextStyle(
                        color: Theme.of(context).textTheme.labelMedium?.color,
                        fontSize: 15
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(introDot[BlocProvider.of<IntroBloc>(context).state.counter]),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HELLO.tr(),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.labelLarge?.color,
                      fontSize: 24
                    ),
                  ),
                  Text(
                    READYMANAGEMENT.tr(),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.labelMedium?.color,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 51),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: 244,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          LOGIN.tr(),
                          style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 24
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        ACCESSWEBSITE.tr(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ]
      )
    );
>>>>>>> Stashed changes
  }
}
