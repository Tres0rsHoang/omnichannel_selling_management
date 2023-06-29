import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrderScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
