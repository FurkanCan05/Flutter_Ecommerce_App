import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:bitirme_projesi/data/data/strings.dart';
import 'package:bitirme_projesi/ui/cubit/profile_photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({super.key});
  final List<int> photos = List.generate(18, (index) => index);
  final String title = Strings.chooseProfilePhoto;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return profilePhonoAlertDialog(screenHeight);
            },
          );
        },
        child: BlocBuilder<ProfilePhotoCubit, int>(
          builder: (context, state) => Stack(
            children: [
              Image.asset("assets/$state.png"),
              Positioned(
                right: 10.0,
                bottom: 10.0,
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: CustomColors.scaffoldBackgroundColor),
                  child: const Icon(Ionicons.color_wand_outline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog profilePhonoAlertDialog(double screenHeight) {
    return AlertDialog(
      title: Center(
        child: Text(title),
      ),
      content: SizedBox(
        width: screenHeight * 0.6,
        height: 400.0,
        child: GridView.builder(
          itemCount: photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<ProfilePhotoCubit>().changeProfilePhoto(index);
                Navigator.pop(context);
              },
              child: Image.asset("assets/$index.png"),
            );
          },
        ),
      ),
    );
  }
}
