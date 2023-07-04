
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/constants/image_assets.dart';
import 'package:selling_management/screens/login_screen/login_screen.dart';

import '../../constants/key_translate.dart';

class IntroScreen extends StatefulWidget{
  const IntroScreen({super.key});

  @override
  State<StatefulWidget> createState() => IntroState();

}

class IntroState extends State<IntroScreen>{
  int picturePosition = 0;

  @override
  Widget build(BuildContext context) {
    var pic = [INTRO_PIC_1, INTRO_PIC_2, INTRO_PIC_3];
    var intro = [INTRO_1.tr(), INTRO_2.tr(), INTRO_3.tr()];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: Image.asset(FULL_LOGO),
          ),
          Flexible(
            flex: 3,
            child: CarouselSlider(
              items: [0,1,2].map((pagePosition) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(flex: 2, child: Image.asset(pic[pagePosition])),
                        Flexible(flex: 1, child: Text(
                          intro[pagePosition],
                          style: TextStyle(
                              color: Theme.of(context).textTheme.labelMedium?.color,
                              fontSize: 15
                          ),
                          textAlign: TextAlign.center,
                        ),),
                      ],
                    );
                  },
                );}).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height/3+85,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() { picturePosition = index;});
                },
              ),
            ),
          ),
          Flexible(
            child: DotsIndicator(
              dotsCount: pic.length,
              position: picturePosition.toDouble(),
            ),
          ),
          Flexible(
            child: Container(
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
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.52,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
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
                Flexible(
                  flex: 1,
                  child: TextButton(
                  onPressed: () {},
                  child: Text(
                    ACCESSWEBSITE.tr(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}