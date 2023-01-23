import 'package:bitirme_projesi/data/entitiy/cart.dart';

class CartResponse {
  List<Cart> cart;
  int success;

  CartResponse({required this.cart, required this.success});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["sepet_yemekler"] as List;
    var carts = jsonArray.map((e) => Cart.fromJson(e)).toList();
    return CartResponse(cart: carts, success: json["success"] as int);
  }
}
