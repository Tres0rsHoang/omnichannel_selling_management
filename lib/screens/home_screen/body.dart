import 'package:flutter/material.dart';
import 'package:selling_management/screens/home_screen/header_with_notify.dart';
import 'package:selling_management/screens/home_screen/option_choice.dart';
import 'package:selling_management/screens/home_screen/tabbar_view.dart';

import 'choice_channel.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWithNotify(size: size),
          Container(
              // color: Colors.blue[50],
              child: Column(
            children: [
              OptionChoice(),
              ChoiceChannel(),
              StatisticalTabBar(),
            ],
          ))
        ],
      ),
    );
  }
}
