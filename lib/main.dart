import 'package:bitirme_projesi/data/data/theme.dart';
import 'package:bitirme_projesi/ui/cubit/cart_page_cubit.dart';
import 'package:bitirme_projesi/ui/cubit/food_detail_cubit.dart';
import 'package:bitirme_projesi/ui/cubit/homepage_cubit.dart';
import 'package:bitirme_projesi/ui/cubit/profile_photo_cubit.dart';
import 'package:bitirme_projesi/ui/screens/homepage.dart';
import 'package:bitirme_projesi/ui/screens/login_page.dart';
import 'package:bitirme_projesi/ui/screens/profile_page.dart';
import 'package:bitirme_projesi/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomepageCubit()),
        BlocProvider(create: (context) => FoodDetailCubit()),
        BlocProvider(create: (context) => CartPageCubit()),
        BlocProvider(create: (context) => ProfilePhotoCubit()),
      ],
      child: MaterialApp(
        title: 'Sipariş Et',
        debugShowCheckedModeBanner: false,
        theme: customTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
