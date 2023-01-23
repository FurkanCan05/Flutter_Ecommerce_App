import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/ui/screens/homepage.dart';
import 'package:bitirme_projesi/ui/screens/navigatorPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final controllerLogo = AnimationController(
      duration: const Duration(milliseconds: 300), vsync: this);
  late final controllerBrand = AnimationController(
      duration: const Duration(milliseconds: 300), vsync: this);
  late final controllerSlogan = AnimationController(
      duration: const Duration(milliseconds: 300), vsync: this);
  late Animation<double> animationLogo = Tween(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(parent: controllerLogo, curve: Curves.easeIn));
  late Animation<double> animationBrand = Tween(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(parent: controllerBrand, curve: Curves.easeIn));
  late Animation<double> animationSlogan = Tween(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(parent: controllerSlogan, curve: Curves.easeIn));

  @override
  void initState() {
    super.initState();

    animation();

    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigatorPage(),
          ));
    });
  }

  Future<void> animation() async {
    controllerLogo.animateTo(1.0);
    await Future.delayed(const Duration(milliseconds: 500));
    controllerBrand.animateTo(1.0);
    await Future.delayed(const Duration(milliseconds: 500));
    controllerSlogan.animateTo(1.0);
  }

  @override
  void dispose() {
    super.dispose();
    controllerLogo.dispose();
    controllerBrand.dispose();
    controllerSlogan.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animationLogo,
              child: Lottie.asset("assets/anim_splash.json",
                  width: 300.0, height: 300.0),
            ),
            ScaleTransition(
              scale: animationBrand,
              child: const Text(
                Strings.brandName,
                style: TextStyle(
                    fontFamily: 'KaushanScript',
                    fontSize: 42.0,
                    color: CustomColors.textColor),
              ),
            ),
            ScaleTransition(
              scale: animationSlogan,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  Strings.slogan,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: CustomColors.textColor,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
