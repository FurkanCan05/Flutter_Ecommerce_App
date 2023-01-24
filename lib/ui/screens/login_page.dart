import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/data/user_data/user_data.dart';
import 'package:bitirme_projesi/ui/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  Strings.loginPageTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Inputs(),
            ],
          ),
        ),
      ),
    );
  }
}

class Inputs extends StatefulWidget {
  Inputs({super.key});
  final mailList = Strings.mailList;

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  var nameInput = TextEditingController();
  var emailInput = TextEditingController();
  var addressInput = TextEditingController();

  String errorMessage = "";
  late String currentMail;
  @override
  void initState() {
    super.initState();
    currentMail = widget.mailList.first;
  }

  Future<void> checkInputs() async {
    if (nameInput.text != "" &&
        emailInput.text != "" &&
        addressInput.text != "") {
      UserData.name = nameInput.text;
      UserData.email = emailInput.text + currentMail;
      UserData.address = addressInput.text;

      var sp = await SharedPreferences.getInstance();
      sp.setString("name", nameInput.text);
      sp.setString("email", emailInput.text + currentMail);
      sp.setString("address", addressInput.text);
      sp.setInt("profilePhoto", 0);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Homepage(),
          ));
    } else {
      setState(() {
        errorMessage = Strings.loginErrorMessage;
        FocusManager.instance.primaryFocus?.unfocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  controller: nameInput,
                  decoration: const InputDecoration(
                    hintText: "Ad, soyad",
                    prefixIcon: Icon(Ionicons.person_outline),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: TextField(
                          controller: emailInput,
                          decoration: const InputDecoration(
                            hintText: "E-posta",
                            prefixIcon: Icon(Ionicons.mail_outline),
                          ),
                        ),
                      ),
                    ),
                    DropdownButton(
                      style: Theme.of(context).textTheme.subtitle2,
                      underline: Container(),
                      value: currentMail,
                      onChanged: (value) {
                        setState(() {
                          currentMail = value!;
                        });
                      },
                      items: widget.mailList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  controller: addressInput,
                  decoration: const InputDecoration(
                    hintText: "Adres",
                    prefixIcon: Icon(Ionicons.location_outline),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () => checkInputs(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      "Kaydet",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  errorMessage,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: CustomColors.red,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
