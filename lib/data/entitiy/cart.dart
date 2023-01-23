class Cart {
  String cartFoodId;
  String cartFoodName;
  String cartImageName;
  String cartFoodPrice;
  String cartCount;
  String cartUserName;

  Cart({
    required this.cartFoodId,
    required this.cartFoodName,
    required this.cartImageName,
    required this.cartFoodPrice,
    required this.cartCount,
    required this.cartUserName,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        cartFoodId: json["sepet_yemek_id"] as String,
        cartFoodName: json["yemek_adi"] as String,
        cartImageName: json["yemek_resim_adi"] as String,
        cartFoodPrice: json["yemek_fiyat"] as String,
        cartCount: json["yemek_siparis_adet"] as String,
        cartUserName: json["kullanici_adi"] as String);
  }
}
