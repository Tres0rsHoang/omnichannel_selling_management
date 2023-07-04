part of 'order_bloc.dart';

class OrderState extends Equatable {
  final int chosenTagIndex;
  const OrderState({required this.chosenTagIndex});

  @override
  List<Object> get props => [
        chosenTagIndex,
      ];
}
