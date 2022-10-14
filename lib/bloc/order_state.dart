part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class GetAllOrderState extends OrderState {
  final List<dynamic> getAllOrders;

  GetAllOrderState({required this.getAllOrders});
}
class ErrorGetAllOrderState extends OrderState {}
class LoadingState extends OrderState {}
class OrderUpdateState extends OrderState {}
