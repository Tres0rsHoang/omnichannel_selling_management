import 'package:flutter/material.dart';
import 'package:selling_management/constants/image_assets.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:selling_management/themes/app_themes.dart';
import 'chart.dart';

class StatisticalTabBar extends StatefulWidget {
  const StatisticalTabBar({Key? key}) : super(key: key);

  @override
  State<StatisticalTabBar> createState() => _StatisticalTabBar();
}

class _StatisticalTabBar extends State<StatisticalTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _controller = TabController(length: 3, vsync: this);
    List item = ['shoppe', 'lazada', 'sendo'];
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Colors.black45.withOpacity(0.23),
            ),
          ]),
      child: Column(
        children: [
          TabBar(
              labelColor: Color.fromARGB(255, 0, 0, 0),
              controller: _controller,
              tabs: [
                Container(
                  height: 100.0,
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Doanh thu"), // set text
                        Text(
                          "15,000,000",
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4%",
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(
                              Icons.arrow_upward,
                              size: 18,
                            )
                          ],
                        )
                      ]),
                ),
                Container(
                  height: 100.0,
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Đơn hàng"), // set text
                        Text(
                          "1,000",
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4%",
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(
                              Icons.arrow_upward,
                              size: 18,
                            )
                          ],
                        )
                      ]),
                ),
                Container(
                  height: 100.0,
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Trung bình"), // set text
                        Text(
                          "1,000",
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4%",
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(
                              Icons.arrow_upward,
                              size: 18,
                            )
                          ],
                        )
                      ]),
                ),
              ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1000,
            child: TabBarView(controller: _controller, children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: 1000,
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: <Widget>[
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 2.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                                padding: EdgeInsets.only(left: 10, top: 0),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .bodyHomeColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(156, 163, 172, 0),
                                        blurRadius: 5,
                                        offset: const Offset(0, 1),
                                        spreadRadius: -2,
                                      ),
                                      
                                    ]),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const CircleAvatar(
                                            minRadius: 15,
                                            backgroundImage:
                                                AssetImage(SHOPEE_LOGO),
                                          ),
                                          SizedBox(width: 10),
                                          Text(item[index])
                                        ],
                                      ),
                                      const Text(
                                        "15,000,000",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "4%",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Icon(
                                            Icons.arrow_upward,
                                            size: 18,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                          },
                          childCount: 3,
                        ),
                      ),
                      
                      SliverFixedExtentList(
                        itemExtent: 600.0,
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                          (BuildContext context, int index) {
                            return Container(
                              
                              alignment: Alignment.center,
                              color: Colors.lightBlue[100 * (index % 9)],
                              child: Column(
                                children: [
                                  LineChartSample1(),
                                  LineChartSample1(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  //   child: Column(children: [
                  //   Container(
                  //     height: 300,

                  //     child: GridView.count(
                  //         primary: false,
                  //         padding: const EdgeInsets.all(20),
                  //         crossAxisSpacing: 10,
                  //         mainAxisSpacing: 10,
                  //         crossAxisCount: 2,
                  //         childAspectRatio: (4 / 2),
                  //         children: List<Widget>.generate(
                  //         item.length,
                  //         (index) {
                  //          return Container(

                  //             decoration: BoxDecoration(
                  //               color:Theme.of(context).backgroundColor,
                  //               borderRadius: BorderRadius.circular(5),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   offset: Offset(0, 0),
                  //                   blurRadius: 5,
                  //                   color: Colors.black45.withOpacity(0.23),
                  //                 ),
                  //               ]),
                  //             padding: const EdgeInsets.all(8),
                  //             child:  Text(item[index]),
                  //           );
                  //         },
                  //         ).toList(),
                  //     ),
                  // ),

                  //   ]),
                ),
              ),
              Container(
                child: Text("tab2"),
              ),
              Container(
                child: Text("tab3"),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
