import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/constants/image_assets.dart';
import 'package:selling_management/constants/key_translate.dart';
import 'package:badges/badges.dart' as badges;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderWithNotify extends StatelessWidget {
  const HeaderWithNotify({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(SAY_HELLO_USER.tr());
    return Column(children: <Widget>[
      Container(
          height: size.height * 0.3,
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                margin: const EdgeInsets.only(
                  bottom: 36 + 10,
                ),
                height: size.height * 0.3 - 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          minRadius: 25,
                          backgroundImage: AssetImage(INTRO_PIC),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // chuaw xu ly text mac dinh

                                  Text("Xin chao, ",
                                      style: TextStyle(color: Colors.white60)),

                                  Text('Nguyen Van A',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              )
                            ])
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        badges.Badge(
                          position: badges.BadgePosition.topEnd(top: 0, end: 2),
                          badgeContent: Text('0'),
                          child: IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Theme.of(context).backgroundColor,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        badges.Badge(
                          position: badges.BadgePosition.topEnd(top: 0, end: 2),
                          badgeContent: Text('0'),
                          child: IconButton(
                            icon: Icon(
                              Icons.message,
                              color: Theme.of(context).backgroundColor,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    height: 110,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.black45.withOpacity(0.23),
                        ),
                      ],
                    ),
                  )),
            ],
          ))
    ]);
  }
}
