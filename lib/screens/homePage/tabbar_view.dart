import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:selling_management/themes/app_themes.dart';

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
              labelColor: Colors.black,
              controller: _controller,
              tabs: const [
                Tab(text: "doanh thu"),
                Tab(text: "doanh thu"),
                Tab(text: "doanh thu"),
              ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1000,
            child: TabBarView(controller: _controller, children: [
              Container(
                child: Container(
                  height: 1000,
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: <Widget>[
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 2.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                color:Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 5,
                                    color: Colors.black45.withOpacity(0.23),
                                  ),
                                ]),
                              alignment: Alignment.center,
                              
                              child: Text(item[index]),
                            );
                          },
                          childCount: 3,
                        ),
                      ),
                      SliverFixedExtentList(
                        itemExtent: 50.0,
                        delegate: SliverChildBuilderDelegate(
                          childCount: 3,
                          (BuildContext context, int index) {
                            return Container(
                              alignment: Alignment.center,
                              color: Colors.lightBlue[100 * (index % 9)],
                              child: Text(item[index]),
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
