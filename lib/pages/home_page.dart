// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_for_you/widgets/app_assets.dart';
import 'package:music_for_you/widgets/app_colors.dart';

import '../widgets/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppColors.appBackground,
            border: Border.all(
              color: AppColors.appBackground,
              width: 10,
            ),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommended for you',
                  style: AppStyles.h3.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontColor,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.appBackground,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
              padding: EdgeInsets.only(top: 15, left: 28),
              child: Image.asset(AppAssets.menuButton)),
          // a rectangular area in Flutter of a material
          // that responds to touch in an application.
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: IconButton(
              icon: Image.asset(AppAssets.searchButton),
              onPressed: () {
                // Add your search functionality here
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.appBackground,
        width: 265,
        child: Column(
          children: [
            _buildMenuItem(AppAssets.userButton, 'Profile', 120),
            _buildMenuItem(AppAssets.heartButton, 'Liked Song', 30),
            _buildMenuItem(AppAssets.settingButton, 'Settings', 30),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String assetPath, String label, double topPadding) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: topPadding, left: 35),
          child: Image.asset(assetPath),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: topPadding - 5, left: 20),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppStyles.h3.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.fontColor,
            ),
          ),
        ),
      ],
    );
  }
}
