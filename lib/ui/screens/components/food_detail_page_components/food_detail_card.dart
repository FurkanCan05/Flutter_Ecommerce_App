import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/data/entitiy/foods.dart';
import 'package:flutter/material.dart';

class FoodDetailCard extends StatelessWidget {
  const FoodDetailCard({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Foods food;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: CustomColors.imageBackgroundColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Image.network(
            "http://kasimadalan.pe.hu/yemekler/resimler/${food.foodImageName}",
            width: screenWidth / 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                food.foodName,
                style: Theme.of(context).textTheme.headline5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "${Strings.turkishLiraSymbol}${food.foodPrice}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
