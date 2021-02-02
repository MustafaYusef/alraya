import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset('assets/splash.json',repeat: true),
    );
  }
}