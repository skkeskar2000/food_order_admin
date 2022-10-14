part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}
class GetAllOrderEvent extends OrderEvent{}

class DeliveredButton extends OrderEvent{
  final String orderId;

  DeliveredButton({required this.orderId});
}


