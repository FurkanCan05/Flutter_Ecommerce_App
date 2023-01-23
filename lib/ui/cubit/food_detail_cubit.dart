import 'package:bitirme_projesi/data/entitiy/foods.dart';
import 'package:bitirme_projesi/data/repo/foods_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailCubit extends Cubit<void> {
  FoodDetailCubit() : super(0);

  var repo = FoodsRepository();

  //Sepete yemek ekleme
  Future<void> addToCart(Foods food, int count) async {
    repo.addToCart(food, count);
  }
}
