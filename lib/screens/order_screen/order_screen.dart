import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/logger.dart';

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

class _OrderState extends State<OrderScreen> {
  int _currentIndex = 0;
  int _chosenTagIndex = 0;

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
              height: 55,
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
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? Colors.blue[500]!
                              : Colors.grey[500]!,
                          width: 1,
                        ),
                        color:
                            isSelected ? Colors.blue[500] : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // width: 160,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                _tagList[index]
                                    .text, // Use the tags list for displaying the text
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.blue[500]!,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[50],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    _tagList[index]
                                        .quantity
                                        .toString(), // Use the tags list for displaying the quantity
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[500],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
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
