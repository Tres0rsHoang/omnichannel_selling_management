import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/logger.dart';
import 'package:selling_management/screens/order_screen/tag_component.dart';

import '../../constants/image_assets.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderState createState() => _OrderState();
}

class Tag {
  String text;
  int quantity;

  Tag({required this.text, required this.quantity});
}

class Order {
  String id;
  String channelName;

  Order({required this.id, required this.channelName});
}

class _OrderState extends State<OrderScreen> {
  int _currentIndex = 0;
  int _chosenTagIndex = 0;
  List<Order> _orderList = [];

  final List<Tag> _tagList = <Tag>[
    Tag(text: 'Tất cả', quantity: 123),
    Tag(text: 'Chờ xác nhận', quantity: 12),
    Tag(text: 'Đã xác nhận', quantity: 45),
    Tag(text: 'Đang đóng gói', quantity: 9),
    Tag(text: 'Đang giao', quantity: 10),
    Tag(text: 'Đã hoàn tất', quantity: 134),
  ];

  void _onHandleScan() {
    logger.d('Scan');
  }

  void _onHandleCalendarFilterModal() {
    logger.d('Calendar');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
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
                itemCount: _tagList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16.0); // Adjust the width as needed
                },
                itemBuilder: (BuildContext context, int index) {
                  final isSelected = _chosenTagIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _chosenTagIndex = index;
                      });
                      // Perform additional actions or logic here based on the selected tag
                      logger.d(
                          'Tag tapped: ${_tagList[index].text}, ${_tagList[index].quantity}');
                    },
                    child: TagComponent(
                        isSelected: isSelected,
                        text: _tagList[index].text,
                        quantity: _tagList[index].quantity),
                  );
                },
              ),
            ),
            Expanded(
              // Added Expanded widget to take remaining vertical space
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: ListView.separated(
                  itemBuilder: (context, position) {
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          'Localpersonshopdfffffffffffffffffffff',
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
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 182, 242, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    'Đang giao hàng',
                                    style: TextStyle(
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.fontFamily,
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 42, 141, 127),
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
                              bottom: 16.0, left: 16.0, right: 16.0, top: 4.0),
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
                                    Container(
                                      height: 20,
                                      width: 27,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey[500]!),
                                        borderRadius: BorderRadius.circular(5),
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
                                        "3309122323343444888888555555555555555",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontFamily,
                                          fontSize: 14,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                        "Amee-Nguyễn Kiều My",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontFamily,
                                          fontSize: 14,
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
                                    '+841234567890',
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
                              bottom: 16.0, left: 16.0, right: 16.0, top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  width: 20,
                                  height: 20,
                                  'https://s7d2.scene7.com/is/image/VansEU/VN0A3WMAVNE-HERO?wid=800&hei=800&fmt=jpg&qlt=85,1&op_sharpen=0&resMode=sharp2&op_usm=1,1,1,0',
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Giày thể thao Air Jordan cho nam cổ thấp màu đen',
                                      style: TextStyle(
                                        fontFamily: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontFamily,
                                        fontSize: 14,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                              Container(
                                                height: 20,
                                                width: 27,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Icon(
                                                  FontAwesomeIcons.bagShopping,
                                                  color: Colors.grey[500],
                                                  size: 18,
                                                ),
                                              ),
                                              SizedBox(width: 2),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4.0),
                                                  child: Text(
                                                    "1.000.000đ",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          Theme.of(context)
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
                                        const Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              'x2',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
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
                        ),
                        Divider(color: Colors.grey[500]),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 16.0, left: 16.0, right: 16.0, top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Ngày đặt hàng: 12/12/2021',
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
                                'Tổng tiền: 1.000.000đ',
                                style: TextStyle(
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontFamily,
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    );
                  },
                  separatorBuilder: (context, position) {
                    return SizedBox(height: 5.0);
                  },
                  itemCount: 20,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Tổng quan',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.newspaper),
              label: 'Đơn hàng',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cartShopping),
              label: 'Sản phẩm',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.box),
              label: 'Kho',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gripVertical),
              label: 'Thêm',
            ),
          ],
          unselectedItemColor: Colors.grey[500],
          selectedItemColor: Colors.blue[300],
          currentIndex: _currentIndex,
          onTap: (value) => {
            setState(() {
              _currentIndex = value;
            })
          },
        ),
      ),
    );
  }
}
