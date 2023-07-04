part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class ChooseTagEvent extends OrderEvent {
  final int chosenTagIndex;

  ChooseTagEvent(this.chosenTagIndex);
}

class UpdateOrderListEvent extends OrderEvent {
  final List<Order> orderList;

  UpdateOrderListEvent(this.orderList);
}

class InitializeOrderEvent extends OrderEvent {
  InitializeOrderEvent();
}
