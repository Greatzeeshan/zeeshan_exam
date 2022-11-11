import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bottom_nav.dart';
import '../utils/color_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(const BottomNavBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorHelper.white,
      body: Center(
        child: Text(
              "Exam",
          style: TextStyle(
            fontSize: 20,
            color: ColorHelper.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
