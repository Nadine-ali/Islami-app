import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class splash_screen extends StatelessWidget {
  static const String RouteName = "splash_screen";

  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, home_screen.RouteName);
    });
    return Scaffold(
      body: Image.asset(
        provider.theme == ThemeMode.light
            ? "assets/images/splash.png"
            : "assets/images/splash_dark.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
