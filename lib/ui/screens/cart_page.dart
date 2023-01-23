import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/data/entitiy/cart.dart';
import 'package:bitirme_projesi/data/user_data/user_data.dart';
import 'package:bitirme_projesi/ui/cubit/cart_page_cubit.dart';
import 'package:bitirme_projesi/ui/screens/components/cart_page_components/cart_page_bottom_bar.dart';
import 'package:bitirme_projesi/ui/screens/components/cart_page_components/cart_page_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    getFoods();
  }

  void getFoods() {
    context.read<CartPageCubit>().getFoods();
  }

  void navigateToHomepage() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.cartPageTitle,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Ionicons.arrow_back_outline,
            color: CustomColors.textColor,
          ),
        ),
      ),
      body: BlocBuilder<CartPageCubit, List<Cart>>(
        builder: (context, list) {
          if (list.isNotEmpty) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: UserData.address,
                        hintStyle: const TextStyle(
                            fontSize: 16.0, color: CustomColors.textColor),
                        prefixIcon: const Icon(
                          Ionicons.location_outline,
                          color: CustomColors.textColor,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Strings.cartPageListTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      var cartItem = list[index];
                      return CartListItem(cartItem: cartItem);
                    },
                  ),
                ),
                BottomBar(cart: list),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(Strings.errorMessageCart,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  ElevatedButton(
                    onPressed: () => navigateToHomepage(),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        Strings.startShoppingNow,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: CustomColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
