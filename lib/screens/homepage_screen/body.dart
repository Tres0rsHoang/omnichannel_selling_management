import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:selling_management/screens/homePage/headerWithNotify.dart';

import '../../constants/image_assets.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:badges/badges.dart' as badges;

class Body extends StatelessWidget {
  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    /// List of Tab Bar Item
    List<String> items = [
      "Home",
      "Explore",
      "Search",
      "Feed",
      "Post",
      "Activity",
      "Setting",
      "Profile",
    ];
  
    /// List of body icon
    List<IconData> icons = [
      Icons.home,
      Icons.explore,
      Icons.search,
      Icons.feed,
      Icons.post_add,
      Icons.local_activity,
      Icons.settings,
      Icons.person
    ];
    int current = 0;
  
    return SingleChildScrollView (
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWithNotify(size: size),
          Container(
            
            decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36)
                  )
                ),
            // color: Colors.blue[50],
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.grey.shade500,
            //             blurRadius: 5,
            //             offset: const Offset(-5, -5),
            //           )
            //         ]
            //       ),
            
            child: Stack(
              children: [
                
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      
                      child: ListView(
                        children: [
                          
                        ],
                      ),
                      // child: ListView.builder(
                      //   scrollDirection: Axis.horizontal,
                      //   itemBuilder: (context, index) {
                      //     return Container(
                      //       margin: EdgeInsets.all(5),
                      //       width: 80,
                      //       height: 45,
                      //       decoration: BoxDecoration(color: Colors.white),
                      //       child: Center(
                      //         child: Text("data"),
                            
                      //       ),
                      //     );
                      //   },
                      // ),  
                    ),
                  
                    
                  ],
                )
              ],
            ),
          )
        ],
      ) ,
      
    );
  }
}