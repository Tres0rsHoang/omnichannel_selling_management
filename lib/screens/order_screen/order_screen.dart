import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selling_management/blocs/order_blocs/order_bloc.dart';
import 'package:selling_management/constants/image_assets.dart';
import 'package:selling_management/screens/order_screen/bottom_order_component.dart';
import 'package:selling_management/screens/order_screen/status_component.dart';
import 'package:selling_management/screens/order_screen/tag_component.dart';
import 'package:selling_management/screens/product_screen/product_screen.dart';
import 'package:selling_management/utils/number.dart';
import 'package:selling_management/utils/string.dart';
import 'package:selling_management/utils/time.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderState createState() => _OrderState();
}

class Channel {
  String id;
  String type;
  String name;

  Channel({
    required this.id,
    required this.type,
    required this.name,
  });
}

class Customer {
  String id;
  String name;
  String phone;

  Customer({
    required this.id,
    required this.name,
    required this.phone,
  });
}

class Order {
  String id;
  Channel channel;
  Customer customer;
  List<Product> products;
  int currentStatus; // 0: Chờ xác nhận, 1: Đã xác nhận, 2: Đang đóng gói, 3: Đang giao, 4: Đã hoàn tất
  int createAt;
  int updateAt;

  Order({
    required this.id,
    required this.channel,
    required this.customer,
    required this.products,
    required this.currentStatus, // 0: Chờ xác nhận, 1: Đã xác nhận, 2: Đang đóng gói, 3: Đang giao, 4: Đã hoàn tất
    required this.createAt,
    required this.updateAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    final channel = Channel(
      id: json['channel']['id'],
      type: json['channel']['type'],
      name: json['channel']['name'],
    );

    final customer = Customer(
      id: json['customer']['id'],
      name: json['customer']['name'],
      phone: json['customer']['phone'],
    );

    final List<dynamic> productsJson = json['products'];
    final List<Product> products = productsJson
        .map((productJson) => Product(
              id: productJson['id'],
              name: productJson['name'],
              image: productJson['image'],
              price: productJson['price'],
              quantity: productJson['quantity'],
            ))
        .toList();

    return Order(
      id: json['id'],
      channel: channel,
      customer: customer,
      products: products,
      currentStatus: json['currentStatus'],
      createAt: json['createAt'],
      updateAt: json['updateAt'],
    );
  }
}

class _OrderState extends State<OrderScreen> {
  // int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final orderBloc = BlocProvider.of<OrderBloc>(context);
    orderBloc.add(InitializeOrderEvent());
  }

  void _onHandleScan() {}

  void _onHandleCalendarFilterModal() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        final orderBloc = BlocProvider.of<OrderBloc>(context);
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
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
                        hintText: 'Nhập để tìm kiếm',
                        hintStyle: TextStyle(
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.fontFamily,
                          fontSize: 16,
                          color: Colors.grey[500],
                        ),
                        prefixIcon: Icon(Icons.search,
                            color: Colors.grey[500], size: 35),
                        suffixIcon: InkWell(
                          onTap: _onHandleScan,
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
                            onTap: _onHandleCalendarFilterModal,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(Icons.calendar_month_sharp,
                                  color: Colors.grey[500], size: 35),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.tagList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16.0); // Adjust the width as needed
                },
                itemBuilder: (BuildContext context, int index) {
                  // final isSelected = _chosenTagIndex == index;
                  final isSelected = state.chosenTagIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        orderBloc.add(ChooseTagEvent(index));
                      });
                    },
                    child: TagComponent(
                      isSelected: isSelected,
                      tag: state.tagList[index],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Stack(
                  children: [
                    ListView.separated(
                      itemBuilder: (context, position) {
                        final totalPrice =
                            orderBloc.state.orderList[position].products.fold(
                                0,
                                (previousValue, element) =>
                                    previousValue +
                                    element.price * element.quantity);
                        return Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, left: 16.0, right: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.square,
                                          size: 25,
                                          color: Colors.grey[500],
                                        ),
                                        SizedBox(width: 7),
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
                                              orderBloc
                                                  .state
                                                  .orderList[position]
                                                  .channel
                                                  .name,
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
                                  StatusComponent(
                                    status: orderBloc.state.orderList[position]
                                        .currentStatus,
                                  ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            orderBloc
                                                .state.orderList[position].id,
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
                                        // '22/06/23 16:06',
                                        formatTimestamp(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            orderBloc.state.orderList[position]
                                                .createAt,
                                          ),
                                        ),
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
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            orderBloc.state.orderList[position]
                                                .customer.name,
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
                                        convertPhoneNumber(orderBloc
                                            .state
                                            .orderList[position]
                                            .customer
                                            .phone),
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
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  'Danh sách sản phẩm',
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                children: orderBloc
                                    .state.orderList[position].products
                                    .map((data) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 16.0,
                                        left: 16.0,
                                        right: 16.0,
                                        top: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.network(
                                            width: 20,
                                            height: 20,
                                            data.image,
                                            fit: BoxFit.fill,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data.name,
                                                style: TextStyle(
                                                  fontFamily: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontFamily,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 27,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Icon(
                                                            FontAwesomeIcons
                                                                .bagShopping,
                                                            color: Colors
                                                                .grey[500],
                                                            size: 18,
                                                          ),
                                                        ),
                                                        SizedBox(width: 2),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 4.0),
                                                            child: Text(
                                                              '${standardizeDecimalNumber(data.price)}đ',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontFamily: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium
                                                                    ?.fontFamily,
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .grey[500],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        'x${data.quantity.toString()}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium
                                                                  ?.fontFamily,
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
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
                                    '${standardizeDecimalNumber(totalPrice)}đ',
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
                            BottomOrderComponent(
                              status: orderBloc
                                  .state.orderList[position].currentStatus,
                            ),
                          ]),
                        );
                      },
                      separatorBuilder: (context, position) {
                        return SizedBox(height: 5.0);
                      },
                      itemCount: orderBloc.state.orderList.length,
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
      },
    );
  }
}
