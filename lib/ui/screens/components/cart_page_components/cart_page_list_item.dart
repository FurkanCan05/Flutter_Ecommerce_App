import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/data/entitiy/cart.dart';
import 'package:bitirme_projesi/ui/cubit/cart_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.cartItem});

  final Cart cartItem;

  void deleteItemFromCart(String id, BuildContext context) {
    context.read<CartPageCubit>().deleteFood(id);
  }

  void increase(Cart cartItem, BuildContext context) {
    context.read<CartPageCubit>().increase(cartItem);
  }

  void decrease(Cart cartItem, BuildContext context) {
    context.read<CartPageCubit>().decrease(cartItem);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(cartItem.cartFoodName),
      background: Container(
        padding: const EdgeInsets.only(right: 20.0),
        color: CustomColors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete,
              color: CustomColors.white,
            ),
          ],
        ),
      ),
      onDismissed: (direction) =>
          deleteItemFromCart(cartItem.cartFoodId, context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    "http://kasimadalan.pe.hu/yemekler/resimler/${cartItem.cartImageName}",
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
                            cartItem.cartFoodName,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              "${Strings.turkishLiraSymbol}${cartItem.cartFoodPrice}",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => decrease(cartItem, context),
                      child: Text(
                        Strings.decreaseButton,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        cartItem.cartCount,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () => increase(cartItem, context),
                      child: Text(
                        Strings.increaseButton,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
