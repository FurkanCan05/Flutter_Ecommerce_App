import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/data/entitiy/foods.dart';
import 'package:bitirme_projesi/ui/cubit/homepage_cubit.dart';
import 'package:bitirme_projesi/ui/cubit/profile_photo_cubit.dart';
import 'package:bitirme_projesi/ui/screens/cart_page.dart';
import 'package:bitirme_projesi/ui/screens/components/homepage_components/filter_popup.dart';
import 'package:bitirme_projesi/ui/screens/components/homepage_components/foods_card.dart';
import 'package:bitirme_projesi/ui/screens/components/homepage_components/search_field.dart';
import 'package:bitirme_projesi/ui/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    getFoods();
  }

  void getFoods() {
    context.read<HomepageCubit>().getFoods();
  }

  void navigateToCartPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.brandName,
          style: TextStyle(
              fontFamily: 'KaushanScript',
              color: CustomColors.black,
              fontSize: 42.0),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage())),
            child: BlocBuilder<ProfilePhotoCubit, int>(
              builder: (context, state) => Image.asset(
                "assets/$state.png",
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => navigateToCartPage(context),
            icon: const Icon(Ionicons.bag_outline),
            color: CustomColors.textColor,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SearchField(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.homepageListTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () => filterPopUp(context),
                      icon: const Icon(Ionicons.filter)),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<HomepageCubit, List<Foods>>(
                builder: (context, list) {
                  if (list.isNotEmpty) {
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        var food = list[index];
                        return FoodsCard(food: food);
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        Strings.errorMessageHomepage,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
