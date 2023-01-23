import 'package:bitirme_projesi/data/user_data/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePhotoCubit extends Cubit<int> {
  ProfilePhotoCubit() : super(0);

  Future<void> changeProfilePhoto(int index) async {
    UserData.profilePhoto = index;
    var sp = await SharedPreferences.getInstance();
    sp.setInt("profilePhoto", index);
    emit(index);
  }
}
