import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff4B2C91),
        body: Center(
          child: Container(
            alignment: Alignment.centerLeft,
            width: 300,
            height: 300,
            child: Image.asset("assets/logo/logo-fix.png"),
          ),
        )
      )
    );
  }
}