class Foods {
  String foodId;
  String foodName;
  String foodImageName;
  String foodPrice;

  Foods(
      {required this.foodId,
      required this.foodName,
      required this.foodImageName,
      required this.foodPrice});

  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(
        foodId: json["yemek_id"] as String,
        foodName: json["yemek_adi"] as String,
        foodImageName: json["yemek_resim_adi"] as String,
        foodPrice: json["yemek_fiyat"] as String);
  }
}
