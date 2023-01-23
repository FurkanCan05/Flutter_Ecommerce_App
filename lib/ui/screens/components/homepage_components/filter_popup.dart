import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/ui/cubit/homepage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> filterPopUp(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    context: context,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: CustomColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.attach_money, color: CustomColors.textColor),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    onPressed: () {
                      context.read<HomepageCubit>().sortingPriceInc();
                      Navigator.pop(context);
                    },
                    child: Text(Strings.sortingPriceInc,
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                ],
              ),
              const Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.attach_money, color: CustomColors.textColor),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    onPressed: () {
                      context.read<HomepageCubit>().sortingPriceDecr();
                      Navigator.pop(context);
                    },
                    child: Text(
                      Strings.sortingPriceDecr,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.sort_by_alpha_outlined,
                      color: CustomColors.textColor),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    onPressed: () {
                      context.read<HomepageCubit>().sortingNameInc();
                      Navigator.pop(context);
                    },
                    child: Text(
                      Strings.sortingNameInc,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.sort_by_alpha_outlined,
                      color: CustomColors.textColor),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    onPressed: () {
                      context.read<HomepageCubit>().sortingNameDecr();
                      Navigator.pop(context);
                    },
                    child: Text(
                      Strings.sortingNameDecr,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
