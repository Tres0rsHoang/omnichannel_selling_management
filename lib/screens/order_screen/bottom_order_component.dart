import 'package:flutter/material.dart';

class BottomOrderComponent extends StatefulWidget {
  final int
      status; // 0: Chờ xác nhận, 1: Đã xác nhận, 2: Đang đóng gói, 3: Đang giao, 4: Đã hoàn tất
  const BottomOrderComponent({super.key, required this.status});

  @override
  State<BottomOrderComponent> createState() => _BottomOrderState();
}

class _BottomOrderState extends State<BottomOrderComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: widget.status == 0
            ? [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Hủy bỏ',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodyMedium?.fontFamily,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Optional spacing between the buttons
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[500],
                    ),
                    onPressed: () {},
                    child: const Text('Xác nhận'),
                  ),
                ),
              ]
            : widget.status == 1
                ? [
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Hủy bỏ',
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
                    ),
                    SizedBox(width: 10), // Optional spacing between the buttons
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[500],
                        ),
                        onPressed: () {},
                        child: const Text('Đóng gói'),
                      ),
                    ),
                  ]
                : widget.status == 2
                    ? [
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Hủy bỏ',
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
                        ),
                        SizedBox(
                            width: 10), // Optional spacing between the buttons
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[500],
                            ),
                            onPressed: () {},
                            child: const Text('Giao hàng'),
                          ),
                        ),
                      ]
                    : widget.status == 3
                        ? [
                            // Optional spacing between the buttons
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[500],
                                ),
                                onPressed: () {},
                                child: const Text('Hoàn tất'),
                              ),
                            ),
                          ]
                        : [
                            // TODO
                          ],
      ),
    );
  }
}
