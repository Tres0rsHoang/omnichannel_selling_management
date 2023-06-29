import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/constants/image_assets.dart';

import '../../constants/key_translate.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Container(
              margin: const EdgeInsets.only(bottom: 45),
                child: Image.asset(FULL_LOGO)
            ),
            Image.asset(INTRO_PIC),
            Text(INTRO_1.tr(), style: TextStyle(color: Theme.of(context).textTheme.labelMedium?.color, fontSize: 15), textAlign: TextAlign.center,),
            TextButton(onPressed: () {}, child: Text(LOGIN.tr())),
            Text(ACCESSWEBSITE.tr()),
          ]
      )
    );
  }
}
