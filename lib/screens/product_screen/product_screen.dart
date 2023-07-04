import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/blocs/product_blocs/product_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductState();
}

class _ProductState extends State<ProductScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final productBloc = BlocProvider.of<ProductBloc>(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Container(),
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
      },
    );
  }
}
