import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selling_management/constants/image_assets.dart';

class Product {
  String id;
  String name;
  String image;
  int price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductState();
}

class _ProductState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 50,
                width: 300,
                child: TextField(
                  cursorColor: Colors.grey[500],
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                    fillColor: Colors.blueGrey[50],
                    filled: true,
                    hintText: 'Tìm theo tên SP/SKU',
                    hintStyle: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                    prefixIcon:
                        Icon(Icons.search, color: Colors.grey[500], size: 35),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VerticalDivider(
                            color: Colors.grey[500],
                            thickness: 1,
                            width: 10,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Icon(Icons.qr_code,
                              color: Colors.grey[500], size: 35),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.filter,
                              color: Colors.grey[500],
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontFamily,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: '2,132',
                                style: TextStyle(
                                  color: Colors.blue[
                                      500], // Set the desired color for "2,132"
                                ),
                              ),
                              const TextSpan(text: ' hàng hóa - Tổng tồn '),
                              TextSpan(
                                text: '3,956',
                                style: TextStyle(
                                  color: Colors.blue[
                                      500], // Set the desired color for "3,956"
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 3.0),
                        child: Text(
                          'Giá bán',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontFamily,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.chevronDown,
                      size: 15,
                      color: Colors.grey[500],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, bottom: 16, top: 16.0),
            child: Stack(
              children: [
                ListView.separated(
                  itemBuilder: (context, position) {
                    return Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(0),

                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            flex: 1,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            onPressed: (BuildContext context) {},
                            backgroundColor: Colors.blue[500]!,
                            foregroundColor: Colors.white,
                            icon: Icons.shelves,
                            label: 'Tồn kho',
                          ),
                          SizedBox(width: 5),
                          SlidableAction(
                            flex: 1,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            onPressed: (BuildContext context) {},
                            backgroundColor: Colors.blue[500]!,
                            foregroundColor: Colors.white,
                            icon: Icons.storefront_sharp,
                            label: 'Đăng bán',
                          ),
                        ],
                      ),

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, left: 16.0, right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        SHOPEE_LOGO,
                                        width: 30,
                                        height: 20,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(width: 3),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Text(
                                            'local shop',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontFamily: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.fontFamily,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                          ),
                          Divider(color: Colors.grey[500]),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0,
                                left: 16.0,
                                right: 16.0,
                                top: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 27,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.grey[500]!),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.moneyBill,
                                          color: Colors.grey[500],
                                          size: 18,
                                        ),
                                      ),
                                      SizedBox(width: 7),
                                      Expanded(
                                        child: Text(
                                          '11111111111',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.fontFamily,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '22/06/23 16:06',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 27,
                                        child: Icon(
                                          FontAwesomeIcons.circleUser,
                                          color: Colors.grey[500],
                                          size: 18,
                                        ),
                                      ),
                                      SizedBox(width: 7),
                                      Expanded(
                                        child: Text(
                                          'Nguyễn Văn A',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.fontFamily,
                                            fontSize: 14,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '+84 123 456 789',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontFamily,
                                        fontSize: 14,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.grey[500]),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 4.0,
                              left: 16.0,
                              right: 16.0,
                              top: 4.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Tổng cộng: ',
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontFamily,
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Text(
                                  '1111',
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontFamily,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    );
                    // return Card(
                    //   elevation: 10,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Column(children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(
                    //           top: 16.0, left: 16.0, right: 16.0),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         mainAxisSize: MainAxisSize.max,
                    //         children: [
                    //           Expanded(
                    //             flex: 1,
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Image.asset(
                    //                   SHOPEE_LOGO,
                    //                   width: 30,
                    //                   height: 20,
                    //                   fit: BoxFit.fill,
                    //                 ),
                    //                 SizedBox(width: 3),
                    //                 Expanded(
                    //                   child: Padding(
                    //                     padding:
                    //                         const EdgeInsets.only(top: 3.0),
                    //                     child: Text(
                    //                       'local shop',
                    //                       overflow: TextOverflow.ellipsis,
                    //                       style: TextStyle(
                    //                         color: Colors.grey[500],
                    //                         fontFamily: Theme.of(context)
                    //                             .textTheme
                    //                             .bodyMedium
                    //                             ?.fontFamily,
                    //                         fontSize: 16,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           SizedBox(width: 15),
                    //         ],
                    //       ),
                    //     ),
                    //     Divider(color: Colors.grey[500]),
                    //     Padding(
                    //       padding: const EdgeInsets.only(
                    //           bottom: 10.0, left: 16.0, right: 16.0, top: 4.0),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         mainAxisSize: MainAxisSize.max,
                    //         children: [
                    //           Expanded(
                    //             flex: 3,
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Container(
                    //                   height: 20,
                    //                   width: 27,
                    //                   decoration: BoxDecoration(
                    //                     border: Border.all(
                    //                         width: 1, color: Colors.grey[500]!),
                    //                     borderRadius: BorderRadius.circular(5),
                    //                   ),
                    //                   child: Icon(
                    //                     FontAwesomeIcons.moneyBill,
                    //                     color: Colors.grey[500],
                    //                     size: 18,
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: 7),
                    //                 Expanded(
                    //                   child: Text(
                    //                     '11111111111',
                    //                     overflow: TextOverflow.ellipsis,
                    //                     style: TextStyle(
                    //                       fontFamily: Theme.of(context)
                    //                           .textTheme
                    //                           .bodyMedium
                    //                           ?.fontFamily,
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.w500,
                    //                       color: Colors.black,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Expanded(
                    //             flex: 2,
                    //             child: Align(
                    //               alignment: Alignment.centerRight,
                    //               child: Text(
                    //                 '22/06/23 16:06',
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: TextStyle(
                    //                   fontSize: 14,
                    //                   color: Colors.grey[500],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding:
                    //           const EdgeInsets.only(left: 16.0, right: 16.0),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         mainAxisSize: MainAxisSize.max,
                    //         children: [
                    //           Expanded(
                    //             flex: 3,
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Container(
                    //                   height: 20,
                    //                   width: 27,
                    //                   child: Icon(
                    //                     FontAwesomeIcons.circleUser,
                    //                     color: Colors.grey[500],
                    //                     size: 18,
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: 7),
                    //                 Expanded(
                    //                   child: Text(
                    //                     'Nguyễn Văn A',
                    //                     overflow: TextOverflow.ellipsis,
                    //                     style: TextStyle(
                    //                       fontFamily: Theme.of(context)
                    //                           .textTheme
                    //                           .bodyMedium
                    //                           ?.fontFamily,
                    //                       fontSize: 14,
                    //                       color: Colors.grey[500],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Expanded(
                    //             flex: 2,
                    //             child: Align(
                    //               alignment: Alignment.centerRight,
                    //               child: Text(
                    //                 '+84 123 456 789',
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: TextStyle(
                    //                   fontFamily: Theme.of(context)
                    //                       .textTheme
                    //                       .bodyMedium
                    //                       ?.fontFamily,
                    //                   fontSize: 14,
                    //                   color: Colors.grey[500],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Divider(color: Colors.grey[500]),
                    //     Padding(
                    //       padding: const EdgeInsets.only(
                    //         bottom: 4.0,
                    //         left: 16.0,
                    //         right: 16.0,
                    //         top: 4.0,
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         mainAxisSize: MainAxisSize.max,
                    //         children: [
                    //           Text(
                    //             'Tổng cộng: ',
                    //             style: TextStyle(
                    //               fontFamily: Theme.of(context)
                    //                   .textTheme
                    //                   .bodyMedium
                    //                   ?.fontFamily,
                    //               fontSize: 14,
                    //               color: Colors.grey[500],
                    //             ),
                    //           ),
                    //           Text(
                    //             '1111',
                    //             style: TextStyle(
                    //               fontFamily: Theme.of(context)
                    //                   .textTheme
                    //                   .bodyMedium
                    //                   ?.fontFamily,
                    //               fontSize: 14,
                    //               color: Colors.black,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ]),
                    // );
                  },
                  separatorBuilder: (context, position) {
                    return SizedBox(height: 5.0);
                  },
                  itemCount: 20,
                ),
                Positioned(
                  bottom: 16, // Adjust the bottom position as needed
                  right: 16, // Adjust the right position as needed

                  child: FloatingActionButton(
                    backgroundColor: Colors.blue[500],
                    onPressed: () {
                      // Handle button press
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
