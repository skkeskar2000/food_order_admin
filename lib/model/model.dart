import 'dart:convert';

class OrderModel {
  OrderModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.orderTime,
    required this.orderImage,
    required this.orderStatus,
    required this.paymentStatus,
    required this.deliveredStatus,
  });

  String id;
  String userId;
  String userName;
  String productName;
  String price;
  String quantity;
  DateTime orderTime;
  String orderImage;
  String orderStatus;
  String paymentStatus;
  String deliveredStatus;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["_id"],
    userId: json["userId"],
    userName: json["userName"],
    productName: json["productName"],
    price: json["price"],
    quantity: json["quantity"],
    orderTime: DateTime.parse(json["orderTime"]),
    orderImage: json["orderImage"],
    orderStatus: json["orderStatus"],
    paymentStatus: json["paymentStatus"],
    deliveredStatus: json["deliveredStatus"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "userName": userName,
    "productName": productName,
    "price": price,
    "quantity": quantity,
    "orderTime": orderTime.toIso8601String(),
    "orderImage": orderImage,
    "orderStatus": orderStatus,
    "paymentStatus": paymentStatus,
    "deliveredStatus": deliveredStatus,
  };
}
