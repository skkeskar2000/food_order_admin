import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_admin/bloc/order_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      context.read<OrderBloc>().add(GetAllOrderEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin View'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: BlocConsumer<OrderBloc, OrderState>(listener: (context, state) {
          if (state is OrderUpdateState) {
            context.read<OrderBloc>().add(GetAllOrderEvent());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Update Status'),
              ),
            );
          }
        }, builder: (context, state) {
          // print(state);
          if(state is OrderUpdateState){
            return Container();
          }
          else if (state is GetAllOrderState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      _reusedTitleWidget("Name"),
                      _reusedTitleWidget("Product Name"),
                      _reusedTitleWidget("Quantity"),
                      _reusedTitleWidget("Price"),
                      _reusedTitleWidget("Payment Status"),
                      _reusedTitleWidget("Delivered Status"),
                      _reusedTitleWidget("Update Status"),
                    ],
                  ),
                  const Divider(),
                  ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: state.getAllOrders.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                state.getAllOrders[index]['userName']
                                    .toString(),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.getAllOrders[index]['productName']
                                    .toString(),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.getAllOrders[index]['quantity']
                                    .toString(),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.getAllOrders[index]['price'].toString(),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.getAllOrders[index]['paymentStatus']
                                    .toString(),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.getAllOrders[index]['deliveredStatus']
                                    .toString(),
                              ),
                            ),
                            Expanded(
                                child: TextButton(
                                    onPressed: () {
                                      print(state.getAllOrders[index]['_id']);
                                      context.read<OrderBloc>().add(
                                            DeliveredButton(
                                              orderId: state.getAllOrders[index]
                                                  ['_id'],
                                            ),
                                          );
                                    },
                                    child: const Text('Delivered'))),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is OrderInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Unable to get order"),
            );
          }
        }),
      ),
    );
  }

  Expanded _reusedTitleWidget(String name) {
    return Expanded(
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
    );
  }
}
