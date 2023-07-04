import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/constants/image_assets.dart';

import '../../constants/key_translate.dart';
import '../../widgets/bottom_navigation_bar.dart';
import 'body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Theme.of(context).backgroundColor,
    //   body: Body(),

    // );
    return Body();
  }
}
