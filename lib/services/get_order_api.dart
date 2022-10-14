import 'package:http/http.dart' as http;

class OrderApi{
  static Future<http.Response>getOrders()async{
    try{
      var url = Uri.parse('https://fast-coast-93759.herokuapp.com/order/getOrder');
      var response = await http.get(url);
      return response;
    }catch(error){
      return http.Response("Server Side error",404);
    }
  }
  static Future<http.Response>updateOrder(String orderId)async{
    try{
      var url = Uri.parse('https://fast-coast-93759.herokuapp.com/order/updateOrder');

      var response = await http.post(url,body: {
        'orderId' : orderId
      });
      return response;

    }catch(error){
      print(error);
      return http.Response("Server error",404);
    }
  }

}
