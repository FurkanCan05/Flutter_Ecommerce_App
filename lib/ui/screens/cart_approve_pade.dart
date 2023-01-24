import 'package:bitirme_projesi/ui/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartApprovePage extends StatefulWidget {
  const CartApprovePage({super.key});

  @override
  State<CartApprovePage> createState() => _CartApprovePageState();
}

class _CartApprovePageState extends State<CartApprovePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Homepage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/anim_confirm.json", width: screenWidth * 0.7),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                "Siparişiniz alındı, teşekkürler!",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
