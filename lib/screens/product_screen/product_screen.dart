import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/blocs/product_blocs/product_bloc.dart';

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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final productBloc = BlocProvider.of<ProductBloc>(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0),
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
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
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
      },
    );
  }
}
