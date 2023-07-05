import 'dart:html';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selling_management/constants/key_translate.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Theme.of(context).colorScheme.background,
              //color: Colors.black,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Transform.translate(
                      offset: const Offset(-100, -80),
                      child: Transform.scale(
                        scale: 1.7,
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
                        offset: const Offset(30, -50),
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
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height*0.04,
                        left: MediaQuery.of(context).size.width*0.05,
                        right: MediaQuery.of(context).size.width*0.05,
                      ),
                      child: Image.asset('lib/assets/images/full_logo.jpg')
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.12),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Theme.of(context).primaryColor)
                            ),
                            hintText: USERNAME.tr(),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Theme.of(context).primaryColor)
                            ),
                            hintText: PASSWORD.tr(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              FORGETPASS.tr(),
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.02,
                      bottom: MediaQuery.of(context).size.height*0.013
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.52,
                      height: MediaQuery.of(context).size.height * 0.06,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.11,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Text(
                            REGISTER.tr(),
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal
                            ),
                          )
                        ),
                        Text(
                          OR.tr()
                        ),
                        Stack(
                          children: [
                            Divider(
                              color: Theme.of(context).primaryColor,
                              thickness: 1,
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                color: Theme.of(context).colorScheme.background,
                                child: Text(
                                  LOGINWITH.tr(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor
                                  ),
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(
                              FontAwesomeIcons.facebook,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(
                              FontAwesomeIcons.apple,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(
                              FontAwesomeIcons.google,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}