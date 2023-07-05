import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selling_management/blocs/intro_blocs/intro_bloc.dart';
import 'package:selling_management/blocs/intro_blocs/intro_event.dart';
import 'package:selling_management/blocs/intro_blocs/intro_state.dart';
import 'package:selling_management/constants/image_assets.dart';

import '../../constants/key_translate.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    var pic = [INTRO_PIC_1, INTRO_PIC_2, INTRO_PIC_3];
    var intro = [INTRO_1.tr(), INTRO_2.tr(), INTRO_3.tr()];

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Container(
                margin: const EdgeInsets.only(top: 90),
                child: Image.asset(
                    FULL_LOGO
                ),
              ),
              CarouselSlider(
                items: [0,1,2].map((pagePosition) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 0),
                          width: 428.0,
                          height: 295.0,
                          child: Image.asset(pic[pagePosition]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child:Text(
                            intro[pagePosition],
                            style: TextStyle(
                                color: Theme.of(context).textTheme.labelMedium?.color,
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
                      BlocProvider.of<IntroBloc>(context).add(ChangePic(index));
                    },
                  ),
              ),
              BlocBuilder<IntroBloc, IntroStates>(
                  builder: (context, states){
                    return
                      Container(
                        child: DotsIndicator(
                          dotsCount: pic.length,
                          position: BlocProvider.of<IntroBloc>(context).state.counter.toDouble(),
                        ),
                      );
                  }
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
  }
}

