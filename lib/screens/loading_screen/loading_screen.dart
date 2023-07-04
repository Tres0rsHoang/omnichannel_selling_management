
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget{
  const LoadingScreen({super.key});
  @override
  State<StatefulWidget> createState() => LoadingState();
}

class LoadingState extends State<LoadingScreen>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                width: 402,
                height: 402,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
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
            Container(
              alignment: Alignment.topRight,
              width: 229,
              height: 229,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(1, 1),
                  colors: <Color>[
                    Color(0xffffffff),
                    Color(0xff1973E5),
                  ],
                  tileMode: TileMode.mirror,
                ),
                shape: BoxShape.circle,
              )
            )
          ],
        ),
        Image.asset('lib/assets/images/full_logo.jpg'),
        const Center(child: CircularProgressIndicator(),),
      ],
    );
  }
  
}