import 'package:bitirme_projesi/data/entitiy/foods.dart';
import 'package:bitirme_projesi/data/repo/foods_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageCubit extends Cubit<List<Foods>> {
  HomepageCubit() : super(<Foods>[]);

  var repo = FoodsRepository();

  //Tüm yemekleri getirme
  Future<void> getFoods() async {
    var list = await repo.getFoods();
    emit(list);
  }

  //Yemek listesinde arama yapma
  Future<void> searchFood(String text) async {
    var list = await repo.getFoods();
    var newList = <Foods>[];

    for (var food in list) {
      if (food.foodName.toLowerCase().contains(text.toLowerCase())) {
        newList.add(food);
      }
    }
    emit(newList);
  }

  //Sıralama- Fiyata göre artan
  Comparator<Foods> sortingPriceIncFunc =
      (a, b) => int.parse(a.foodPrice).compareTo(int.parse(b.foodPrice));
  Future<void> sortingPriceInc() async {
    var list = await repo.getFoods();
    list.sort(sortingPriceIncFunc);
    emit(list);
  }

  //Sıralama- Fiyata göre azalan
  Comparator<Foods> sortingPriceDecrFunc =
      (a, b) => int.parse(b.foodPrice).compareTo(int.parse(a.foodPrice));
  Future<void> sortingPriceDecr() async {
    var list = await repo.getFoods();
    list.sort(sortingPriceDecrFunc);
    emit(list);
  }

  //Sıralama- Ada göre artan
  Comparator<Foods> sortingNameIncFunc =
      (a, b) => a.foodName.compareTo(b.foodName);
  Future<void> sortingNameInc() async {
    var list = await repo.getFoods();
    list.sort(sortingNameIncFunc);
    emit(list);
  }

  //Sıralama- Fiyata göre azalan
  Comparator<Foods> sortingNameDecrFunc =
      (a, b) => b.foodName.compareTo(a.foodName);
  Future<void> sortingNameDecr() async {
    var list = await repo.getFoods();
    list.sort(sortingNameDecrFunc);
    emit(list);
  }
}
