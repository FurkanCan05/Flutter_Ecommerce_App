import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/data/entitiy/foods.dart';
import 'package:bitirme_projesi/ui/screens/food_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class FoodsCard extends StatelessWidget {
  const FoodsCard({super.key, required this.food});

  final Foods food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return FoodDetailPage(food: food);
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
        );
      },
      child: Container(
        color: CustomColors.scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.imageBackgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.network(
                  "http://kasimadalan.pe.hu/yemekler/resimler/${food.foodImageName}",
                  height: 100,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.foodName,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            "${Strings.turkishLiraSymbol}${food.foodPrice}",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Icon(Ionicons.arrow_forward_outline),
            ],
          ),
        ),
      ),
    );
  }
}
