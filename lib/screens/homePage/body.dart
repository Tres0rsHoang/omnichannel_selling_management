import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:selling_management/screens/homePage/headerWithNotify.dart';
import 'package:selling_management/screens/homePage/tabbar_view.dart';

import '../../constants/image_assets.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:badges/badges.dart' as badges;

import 'package:selling_management/screens/homePage/option_choice.dart';

import 'choice_channel.dart';

class Body extends StatelessWidget {
  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWithNotify(size: size),
          Container(
          // color: Colors.blue[50],
          child: const Column(
          
          children: [
          OptionChoice(),
          ChoiceChannel(),
          StatisticalTabBar(),

          ],
          )
          )
          
          
        ],
      ),
    );
  }
}
