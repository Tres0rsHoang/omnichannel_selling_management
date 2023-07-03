import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderState(chosenTagIndex: 0)) {
    on<ChooseTagEvent>(_onSelectTag);
  }

  void _onSelectTag(ChooseTagEvent event, Emitter<OrderState> emit) {
    emit(OrderState(chosenTagIndex: event.chosenTagIndex));
  }
}
