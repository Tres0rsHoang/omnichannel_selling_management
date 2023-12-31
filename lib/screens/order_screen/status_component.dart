import 'package:flutter/material.dart';

class StatusComponent extends StatefulWidget {
  final int
      status; // 0: Chờ xác nhận, 1: Đã xác nhận, 2: Đang đóng gói, 3: Đang giao, 4: Đã hoàn tất
  const StatusComponent({super.key, required this.status});

  @override
  State<StatusComponent> createState() => _StatusState();
}

class _StatusState extends State<StatusComponent> {
  @override
  Widget build(BuildContext context) {
    return widget.status == 0
        ? Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 219, 213, 255),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Chờ xác nhận',
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  fontSize: 11,
                  color: Color.fromARGB(255, 99, 90, 169),
                ),
              ),
            ),
          )
        : widget.status == 1
            ? Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 194, 108),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    'Đã xác nhận',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                      fontSize: 11,
                      color: Color.fromARGB(255, 76, 78, 12),
                    ),
                  ),
                ),
              )
            : widget.status == 2
                ? Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 183, 242, 236),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        'Đang đóng gói',
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
                  )
                : widget.status == 3
                    ? Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 254, 239, 210),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            'Đang giao',
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontFamily,
                              fontSize: 11,
                              color: Color.fromARGB(255, 157, 119, 31),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 192, 253, 211),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            'Đã hoàn tất',
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontFamily,
                              fontSize: 11,
                              color: Color.fromARGB(255, 100, 183, 129),
                            ),
                          ),
                        ),
                      );
  }
}
