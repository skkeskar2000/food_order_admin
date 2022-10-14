import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_admin/services/get_order_api.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<GetAllOrderEvent>((event, emit) async{
      var response = await OrderApi.getOrders();
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        emit(GetAllOrderState(getAllOrders: data as List));
      }
      else{
        emit(ErrorGetAllOrderState());
      }
    });

    on<DeliveredButton>((event, emit) async{
      emit(OrderInitial());
      var response = await OrderApi.updateOrder(event.orderId);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        print(data);
        emit(OrderUpdateState());
      }
      else{
        emit(ErrorGetAllOrderState());
      }
      print(response);
    });
  }
}
