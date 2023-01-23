import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/ui/cubit/homepage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  void searchFood(BuildContext context, String text) {
    context.read<HomepageCubit>().searchFood(text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) => searchFood(context, value),
            maxLines: 1,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Ionicons.search,
                size: 30.0,
                color: CustomColors.textColor,
              ),
              hintText: Strings.searchText,
            ),
          ),
        ),
      ],
    );
  }
}
