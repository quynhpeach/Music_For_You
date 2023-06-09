import 'package:get/get.dart';
import 'package:music_for_you/repository/authentication_repository.dart';
import 'package:music_for_you/repository/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  //get user email and pass to user reposiotory to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}
