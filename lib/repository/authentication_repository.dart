import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_for_you/exceptions/signup_email_password_failure.dart';
import 'package:music_for_you/pages/home_page.dart';
import 'package:music_for_you/pages/sign_in.dart';
import 'package:music_for_you/pages/sign_up.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6)); //sau 5s sẽ
    firebaseUser = Rx<User?>(_auth.currentUser); //user có thể null -> thêm dấu?
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser,
        _setInitialScreen); //gọi khi điều kiện thay đổi, ở đây là firebaseuser
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const SignIn())
        : Get.offAll(() => const HomePage());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const SignIn()) //push
          : Get.to(() => const HomePage()); //pop
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logInWithEmailAndPassWord(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}

    Future<void> logout() async => await _auth.signOut();
  }
}
