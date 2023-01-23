import 'dart:convert';
import 'package:bitirme_projesi/data/entitiy/cart.dart';
import 'package:bitirme_projesi/data/entitiy/cart_response.dart';
import 'package:bitirme_projesi/data/entitiy/foods.dart';
import 'package:bitirme_projesi/data/entitiy/foods_response.dart';
import 'package:bitirme_projesi/data/user_data/user_data.dart';
import 'package:dio/dio.dart';

class FoodsRepository {
  //URL ler
  String urlGetAllFoods =
      "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
  String urlGetCartFoods =
      "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
  String urlAddFoodToCart =
      "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
  String urlDeleteFoodFromCart =
      "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";

  //Gelen json nesnesini parçalama
  List<Foods> parseFoodsResponse(String response) {
    try {
      return FoodsResponse.fromJson(json.decode(response)).food;
    } catch (e) {
      return [];
    }
  }

  List<Cart> parseCartFoodsResponse(String response) {
    try {
      return CartResponse.fromJson(json.decode(response)).cart;
    } catch (e) {
      return [];
    }
  }

  //Tüm yemekleri getirme
  Future<List<Foods>> getFoods() async {
    var response = await Dio().get(urlGetAllFoods);
    return parseFoodsResponse(response.data.toString());
  }

  //Sepetteki yemekleri getirme
  Future<List<Cart>> getFoodsOnCart() async {
    var data = {"kullanici_adi": UserData.email};
    var response =
        await Dio().post(urlGetCartFoods, data: FormData.fromMap(data));
    return parseCartFoodsResponse(response.data.toString());
  }

  //Sepete yemek ekleme
  Future<void> addToCart(Foods food, int count) async {
    var totalCount = count;
    var cartList = await getFoodsOnCart();
    for (var cartItem in cartList) {
      if (cartItem.cartFoodName == food.foodName) {
        totalCount += int.parse(cartItem.cartCount);
        deleteFoodFromList(int.parse(cartItem.cartFoodId));
      }
    }

    var data = {
      "yemek_adi": food.foodName,
      "yemek_resim_adi": food.foodImageName,
      "yemek_fiyat": int.parse(food.foodPrice),
      "yemek_siparis_adet": totalCount,
      "kullanici_adi": UserData.email,
    };

    await Dio().post(urlAddFoodToCart, data: FormData.fromMap(data));
  }

  //Sepetteki tüm yemekleri silme
  Future<void> deleteAllFoodsFromCart() async {
    var cartList = await getFoodsOnCart();

    for (var item in cartList) {
      deleteFoodFromList(int.parse(item.cartFoodId));
    }
  }

  //Sepetteki yemeği 1 arttırma
  Future<void> increaseItemFromCart(Cart cartItem) async {
    await addToCart(
        Foods(
            foodId: cartItem.cartFoodId,
            foodImageName: cartItem.cartImageName,
            foodName: cartItem.cartFoodName,
            foodPrice: cartItem.cartFoodPrice),
        1);
  }

  //Sepetteki yemeği 1 azaltma
  Future<void> desreaseItemFromCart(Cart cartItem) async {
    int totalCount = int.parse(cartItem.cartCount);
    var cartList = await getFoodsOnCart();
    for (var listItem in cartList) {
      if (cartItem.cartFoodName == listItem.cartFoodName) {
        totalCount = int.parse(listItem.cartCount) - 1;
      }
    }

    await deleteFoodFromList(int.parse(cartItem.cartFoodId));

    if (totalCount >= 1) {
      var data = {
        "yemek_adi": cartItem.cartFoodName,
        "yemek_resim_adi": cartItem.cartImageName,
        "yemek_fiyat": int.parse(cartItem.cartFoodPrice),
        "yemek_siparis_adet": totalCount,
        "kullanici_adi": UserData.email,
      };

      await Dio().post(urlAddFoodToCart, data: FormData.fromMap(data));
    }
  }

  //Sepetten yemek silme
  Future<void> deleteFoodFromList(int id) async {
    var data = {"sepet_yemek_id": id, "kullanici_adi": UserData.email};
    await Dio().post(urlDeleteFoodFromCart, data: FormData.fromMap(data));
  }
}
