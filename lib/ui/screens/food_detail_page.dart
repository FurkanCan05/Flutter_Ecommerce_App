import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/entitiy/foods.dart';
import 'package:bitirme_projesi/ui/screens/components/food_detail_page_components/food_detail_bottom_bar.dart';
import 'package:bitirme_projesi/ui/screens/components/food_detail_page_components/food_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.food});
  final Foods food;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Ionicons.close,
                color: Colors.transparent,
                size: 42,
              ),
              Text(
                food.foodName,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  color: CustomColors.textColor,
                ),
              ),
            ],
          ),
          FoodDetailCard(
            food: food,
          ),
          FoodDetailBottomBar(food: food),
        ],
      ),
    );
  }
}
