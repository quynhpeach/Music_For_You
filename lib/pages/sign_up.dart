// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_for_you/pages/sign_in.dart';

import '../widgets/app_colors.dart';
import '../widgets/app_styles.dart';
import 'email_password.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      child: Text('Sign up',
                          style: AppStyles.h2.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.fontColor)),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 15, left: 30),
                      child: Text('Name',
                          style: AppStyles.h4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.fontColor)),
                    ),
                    Padding(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.only(top: 19, left: 30, right: 50),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          //padding: EdgeInsets.only(top: 19, left: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 247, 243, 243)
                                  .withOpacity(0.1)),
                          child: TextField(
                            style: TextStyle(color: AppColors.fontColor),
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person,
                                    color: Color.fromARGB(190, 228, 222, 222)),
                                hintText: "Enter your name",
                                hintStyle: AppStyles.h4
                                    .copyWith(color: AppColors.colorGrey)),
                          )),
                    ),
                    EmailPassword(),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 40,
                      width: 275,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 243, 243)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text('Create account',
                              textAlign: TextAlign.center,
                              style: AppStyles.h5
                                  .copyWith(color: AppColors.fontColor))),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an accout? ",
                          style: AppStyles.h4.copyWith(
                              color: AppColors.colorGrey,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) => SignIn()));
                          },
                          child: Text(
                            "Sign in",
                            style: AppStyles.h4.copyWith(
                                color: AppColors.colorGrey,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
