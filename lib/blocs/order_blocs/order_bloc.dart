import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:selling_management/logger.dart';
import 'package:selling_management/screens/order_screen/order_screen.dart';
import 'package:selling_management/screens/order_screen/tag_component.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc()
      : super(
          const OrderState(
            chosenTagIndex: 0,
            orderList: [],
            tagList: [],
          ),
        ) {
    on<InitializeOrderEvent>(_initializeOrderList);
    on<ChooseTagEvent>(_onSelectTag);
    on<UpdateOrderListEvent>(_onUpdateOrderList);
  }

  Future<List<Order>> readOrdersJson() async {
    try {
      final String response =
          await rootBundle.loadString('lib/assets/seeds/orders.json');
      final List<dynamic> jsonData = json.decode(response);
      final List<Order> orderList =
          jsonData.map((json) => Order.fromJson(json)).toList();
      return orderList;
    } catch (e) {
      logger.d('Error reading orders JSON file: $e');
      return [];
    }
  }

  Future<List<Tag>> readTagsJson() async {
    try {
      final String response =
          await rootBundle.loadString('lib/assets/seeds/tags.json');
      final List<dynamic> jsonData = json.decode(response);
      final List<Tag> tagList =
          jsonData.map((json) => Tag.fromJson(json)).toList();
      return tagList;
    } catch (e) {
      logger.d('Error reading tags JSON file: $e');
      return [];
    }
  }

  FutureOr<void> _initializeOrderList(
      InitializeOrderEvent event, Emitter<OrderState> emit) async {
    try {
      final List<Order> orderList = await readOrdersJson();
      final List<Tag> tagList = await readTagsJson();
      emit(
        OrderState(
          chosenTagIndex: 0,
          orderList: orderList,
          tagList: tagList,
        ),
      );
    } catch (e) {
      logger.d('Error initializing order list: $e');
    }
  }

  void _onSelectTag(ChooseTagEvent event, Emitter<OrderState> emit) {
    emit(
      OrderState(
        chosenTagIndex: event.chosenTagIndex,
        orderList: state.orderList,
        tagList: state.tagList,
      ),
    );
  }

  void _onUpdateOrderList(
      UpdateOrderListEvent event, Emitter<OrderState> emit) {
    emit(
      OrderState(
        chosenTagIndex: state.chosenTagIndex,
        orderList: event.orderList,
        tagList: state.tagList,
      ),
    );
  }
}
