import 'package:bitirme_projesi/data/user_data/user_data.dart';
import 'package:bitirme_projesi/ui/screens/homepage.dart';
import 'package:bitirme_projesi/ui/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  void initState() {
    super.initState();
    readDatas();
  }

  Future<void> readDatas() async {
    var sp = await SharedPreferences.getInstance();
    var readName = sp.getString("name");
    var readEmail = sp.getString("email");
    var readAddress = sp.getString("address");
    var readProfilePhoto = sp.getInt("profilePhoto");

    if (readName == null &&
        readEmail == null &&
        readAddress == null &&
        readProfilePhoto == null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ));
    } else {
      UserData.name = readName!;
      UserData.address = readAddress!;
      UserData.email = readEmail!;
      UserData.profilePhoto = readProfilePhoto!;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Homepage(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
