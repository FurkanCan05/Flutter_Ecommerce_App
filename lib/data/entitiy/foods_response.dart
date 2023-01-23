import 'package:bitirme_projesi/data/entitiy/foods.dart';

class FoodsResponse {
  List<Foods> food;
  int success;

  FoodsResponse({required this.food, required this.success});

  factory FoodsResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["yemekler"] as List;
    var foods = jsonArray.map((e) => Foods.fromJson(e)).toList();
    return FoodsResponse(food: foods, success: json["success"] as int);
  }
}
