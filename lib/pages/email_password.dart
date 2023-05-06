// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/app_colors.dart';
import '../widgets/app_styles.dart';

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class EmailPassword extends StatefulWidget {
  const EmailPassword({super.key});

  get signIn => null;
  @override
  State<EmailPassword> createState() => _EmailPasswordState();
}

class _EmailPasswordState extends State<EmailPassword> {
  @override
  void dispose() {
    // _emailController.dispose();
    // _passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 15, left: 30),
            child: Text('Email',
                style: AppStyles.h4.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.fontColor)),
          ),
          Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.only(top: 19, left: 30, right: 50),
            child: Container(
                alignment: Alignment.centerLeft,
                //padding: EdgeInsets.only(top: 19, left: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 247, 243, 243).withOpacity(0.1)),
                child: TextField(
                  style: TextStyle(color: AppColors.fontColor),
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined,
                          color: Color.fromARGB(190, 228, 222, 222)),
                      hintText: "Enter your email",
                      hintStyle:
                          AppStyles.h4.copyWith(color: AppColors.colorGrey)),
                )),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text('Password',
                style: AppStyles.h4.copyWith(
                    color: AppColors.fontColor, fontWeight: FontWeight.bold)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 50),
              child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          Color.fromARGB(255, 247, 243, 243).withOpacity(0.1)),
                  child: TextField(
                    style: TextStyle(color: AppColors.fontColor),
                    controller: _passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key_outlined,
                            color: Color.fromARGB(190, 228, 222, 222)),
                        hintText: "Enter your password",
                        hintStyle:
                            AppStyles.h4.copyWith(color: AppColors.colorGrey)),
                  ))),
        ],
      ),
    );
  }
}
