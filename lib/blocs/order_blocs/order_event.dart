part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class ChooseTagEvent extends OrderEvent {
  final int chosenTagIndex;

  ChooseTagEvent(this.chosenTagIndex);
}
