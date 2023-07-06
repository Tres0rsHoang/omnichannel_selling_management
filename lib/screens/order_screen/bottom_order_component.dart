import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/constants/key_translate.dart';

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
                      CANCEL.tr(),
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodyMedium?.fontFamily,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ), // Optional spacing between the buttons
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      CONFIRM.tr(),
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodyMedium?.fontFamily,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
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
                          CANCEL.tr(),
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
                    const SizedBox(
                      width: 10,
                    ), // Optional spacing between the buttons
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {},
                        child: Text(
                          PACKAGE.tr(),
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
                  ]
                : widget.status == 2
                    ? [
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              CANCEL.tr(),
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
                        const SizedBox(
                          width: 10,
                        ), // Optional spacing between the buttons
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {},
                            child: Text(
                              DELIVER.tr(),
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
                      ]
                    : widget.status == 3
                        ? [
                            Expanded(
                              flex: 1,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  RETURN_GOODS.tr(),
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
                            const SizedBox(
                              width: 10,
                            ),
                            // Optional spacing between the buttons
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                onPressed: () {},
                                child: Text(
                                  DONE.tr(),
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
                          ]
                        : [
                            // TODO
                          ],
      ),
    );
  }
}
