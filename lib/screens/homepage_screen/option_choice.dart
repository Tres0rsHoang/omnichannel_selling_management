// import 'package:flutter/material.dart';

// class HeaderWithNotify extends StatelessWidget {
//   const HeaderWithNotify({
//     Key? key,
//     required this.size,
//   }) : super(key: key);
  
//   final Size size;

//   @override
//   Widget build(BuildContext context) {
  
//     List<String> items = [
//     "Home",
//     "Explore",
//     "Search",
//     "Feed",
//     "Post",
//     "Activity",
//     "Setting",
//     "Profile",
//   ];

//   /// List of body icon
//   List<IconData> icons = [
//     Icons.home,
//     Icons.explore,
//     Icons.search,
//     Icons.feed,
//     Icons.post_add,
//     Icons.local_activity,
//     Icons.settings,
//     Icons.person
//   ];
//   int current = 0;
//     return Container(
//         width: double.infinity,
//         height: double.infinity,
//         margin: const EdgeInsets.all(5),
//         child: Column(
//           children: [
//             /// CUSTOM TABBAR
//             SizedBox(
//               width: double.infinity,
//               height: 60,
//               child: ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: items.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (ctx, index) {
//                     return Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               current = index;
//                             });
//                           },
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 300),
//                             margin: const EdgeInsets.all(5),
//                             width: 80,
//                             height: 45,
//                             decoration: BoxDecoration(
//                               color: current == index
//                                   ? Colors.white70
//                                   : Colors.white54,
//                               borderRadius: current == index
//                                   ? BorderRadius.circular(15)
//                                   : BorderRadius.circular(10),
//                               border: current == index
//                                   ? Border.all(
//                                       color: Colors.deepPurpleAccent, width: 2)
//                                   : null,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 items[index],
//                                 style: GoogleFonts.laila(
//                                     fontWeight: FontWeight.w500,
//                                     color: current == index
//                                         ? Colors.black
//                                         : Colors.grey),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Visibility(
//                             visible: current == index,
//                             child: Container(
//                               width: 5,
//                               height: 5,
//                               decoration: const BoxDecoration(
//                                   color: Colors.deepPurpleAccent,
//                                   shape: BoxShape.circle),
//                             ))
//                       ],
//                     );
//                   }),
//             ),

//   }
//   }