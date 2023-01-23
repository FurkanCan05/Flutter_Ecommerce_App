import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/data/user_data/user_data.dart';
import 'package:bitirme_projesi/ui/screens/components/profile_page_components/profile_photo.dart';
import 'package:bitirme_projesi/ui/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> deleteProfile(BuildContext context) async {
    var sp = await SharedPreferences.getInstance();
    sp.remove("name");
    sp.remove("email");
    sp.remove("address");
    sp.remove("profilePhoto");
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.profilePageTitle,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Ionicons.arrow_back_outline,
              color: CustomColors.textColor,
            )),
        actions: [
          IconButton(
            onPressed: () => deleteProfile(context),
            icon: const Icon(
              Ionicons.log_out_outline,
              color: CustomColors.textColor,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ProfilePhoto(),
            const Informations(),
          ],
        ),
      ),
    );
  }
}

class Informations extends StatelessWidget {
  const Informations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  UserData.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "E-mail:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      UserData.email,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Adres:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      UserData.address,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
