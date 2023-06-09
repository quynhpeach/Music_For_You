import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music_for_you/repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email =
      TextEditingController(); //callback (onsubmitted,...), có thể dùng autofocus
  final password = TextEditingController();
  final name = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
