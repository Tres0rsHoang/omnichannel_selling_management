import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
    child:  BottomNavigationBar(
    
      items: [
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
    )
    
    );
    
  }
}