import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: sc,
      child: Center(child: Lottie.asset('assets/splashl.json',repeat: true)),
    );
  }
}