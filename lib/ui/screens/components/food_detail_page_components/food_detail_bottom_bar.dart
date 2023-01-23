import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/data/entitiy/foods.dart';
import 'package:bitirme_projesi/data/user_data/user_data.dart';
import 'package:bitirme_projesi/ui/cubit/food_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailBottomBar extends StatefulWidget {
  const FoodDetailBottomBar({super.key, required this.food});

  final Foods food;

  @override
  State<FoodDetailBottomBar> createState() => _FoodDetailBottomBarState();
}

class _FoodDetailBottomBarState extends State<FoodDetailBottomBar> {
  int count = 1;

  void inc() {
    setState(() {
      count++;
    });
  }

  void deinc() {
    if (count != 1) {
      setState(() {
        count--;
      });
    }
  }

  void addToCart(Foods food, int count) {
    context.read<FoodDetailCubit>().addToCart(food, count);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => deinc(),
                child: Text(
                  Strings.decreaseButton,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              TextButton(
                onPressed: () => inc(),
                child: Text(
                  Strings.increaseButton,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                onPressed: () => addToCart(widget.food, count),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    Strings.addToCartText,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
