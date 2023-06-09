// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_for_you/pages/email_password.dart';
import 'package:music_for_you/pages/home_page.dart';
import 'package:music_for_you/pages/sign_up.dart';
import 'package:music_for_you/services/auth_service.dart';
import 'package:music_for_you/widgets/app_assets.dart';

import '../widgets/app_colors.dart';
import '../widgets/app_styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool check = false;
  bool showTermsValidate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text('MusicForYou',
              style: AppStyles.h1.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.fontColor)),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sign_up.png"),
                    fit: BoxFit.cover),
              ),
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 160, left: 30),
                    alignment: Alignment.centerLeft,
                    child: Text('Sign in',
                        style: AppStyles.h2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.fontColor)),
                  ),
                  EmailPassword(),
                  Container(
                    //padding: EdgeInsets.only(top: 9, left: 33),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 1, left: 33),
                          child: Theme(
                            data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5)))),
                            child: Transform.scale(
                              scale: 0.8,
                              child: Checkbox(
                                value: check,
                                activeColor: Color.fromARGB(190, 228, 222, 222),
                                checkColor: Colors.white,
                                //tileColor: Color.fromARGB(190, 228, 222, 222),
                                onChanged: (bool? value) {
                                  setState(() {
                                    check = value!;
                                  });
                                },
                                //controlAffinity: ListTileControlAffinity.leading,
                                side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                        width: 1.5,
                                        color: Color.fromARGB(
                                            190, 228, 222, 222))),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(top: 13.5, left: 2),
                            child: Text("Remember me",
                                style: AppStyles.h5
                                    .copyWith(color: AppColors.colorGrey))),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(top: 13.5, left: 36),
                            child: Text("Forgot password",
                                style: AppStyles.h5
                                    .copyWith(color: AppColors.colorGrey))),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: 275,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => HomePage())));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 243, 243)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('Login',
                              textAlign: TextAlign.center,
                              style: AppStyles.h5
                                  .copyWith(color: AppColors.fontColor))),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Or login with",
                    style: AppStyles.h4.copyWith(
                        color: AppColors.colorGrey,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 40, left: 130),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 45),
                            child: GestureDetector(
                              child: Image.asset(
                                AppAssets.googleButton,
                              ),
                              // child: FaIcon(FontAwesomeIcons.google,
                              //     size: 50, color: Colors.white),
                              onTap: () => AuthService().signInWithGoogle(),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => SignUp())));
                    },
                    child: Text(
                      "Create an account",
                      style: AppStyles.h4.copyWith(
                          color: AppColors.colorGrey,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        ));
  }
}
