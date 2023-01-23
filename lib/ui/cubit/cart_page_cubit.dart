import 'package:bitirme_projesi/data/entitiy/cart.dart';
import 'package:bitirme_projesi/data/repo/foods_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPageCubit extends Cubit<List<Cart>> {
  CartPageCubit() : super(<Cart>[]);

  var repo = FoodsRepository();
  Comparator<Cart> sortingNameIncFunc =
      (a, b) => a.cartFoodName.compareTo(b.cartFoodName);

  //Sepetteki tüm yemekleri getirme
  Future<void> getFoods() async {
    var list = await repo.getFoodsOnCart();
    list.sort(sortingNameIncFunc);
    emit(list);
  }

  //Sepetten yemek silme
  Future<void> deleteFood(String id) async {
    await repo.deleteFoodFromList(int.parse(id));
    getFoods();
  }

  //Sepetteki tüm yemekleri silme
  Future<void> deleteAllFoodsFromCart() async {
    await repo.deleteAllFoodsFromCart();
  }

  //Sepetteki yemek adedini arttırma
  Future<void> increase(Cart cartItem) async {
    await repo.increaseItemFromCart(cartItem);
    getFoods();
  }

  //Sepetteki yemek adedini azaltma
  Future<void> decrease(Cart cartItem) async {
    await repo.desreaseItemFromCart(cartItem);
    getFoods();
  }
}
