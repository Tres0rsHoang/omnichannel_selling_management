part of 'order_bloc.dart';

class OrderState extends Equatable {
  final int chosenTagIndex;
  final List<Order> orderList;
  final List<Tag> tagList;

  const OrderState({
    required this.chosenTagIndex,
    required this.orderList,
    required this.tagList,
  });

  @override
  List<Object> get props => [
        chosenTagIndex,
        orderList,
        tagList,
      ];
}
