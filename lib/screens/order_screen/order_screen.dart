import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrderScreen> {
  int _currentIndex = 0;

  void _onHandleScan() {
    print('Scan');
  }

  void _onHandleCalendarFilterModal() {
    print('Calendar');
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
