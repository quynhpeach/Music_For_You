// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_for_you/firebase_options.dart';
import 'package:music_for_you/pages/home_page.dart';
import 'package:music_for_you/pages/sign_in.dart';

import 'package:music_for_you/pages/main_page.dart';
import 'package:music_for_you/pages/sign_in.dart';
import 'package:music_for_you/repository/authentication_repository.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
          name: 'musicforyou-a6205',
          options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
