import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/data/entitiy/cart.dart';
import 'package:bitirme_projesi/ui/cubit/cart_page_cubit.dart';
import 'package:bitirme_projesi/ui/screens/cart_approve_pade.dart';
import 'package:bitirme_projesi/ui/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.cart});

  final List<Cart> cart;

  String calculateTotalPrice() {
    var totalPrice = 0;
    for (var item in cart) {
      totalPrice += int.parse(item.cartFoodPrice) * int.parse(item.cartCount);
    }
    return totalPrice.toString();
  }

  void clearCart(BuildContext context) {
    context.read<CartPageCubit>().deleteAllFoodsFromCart();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CartApprovePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.cartTotalPriceText,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: CustomColors.textColor),
                  ),
                  Text(
                    Strings.turkishLiraSymbol + calculateTotalPrice(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: CustomColors.textColor),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => clearCart(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        Strings.confirmCartText,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
