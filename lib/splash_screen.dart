import 'dart:async';

import 'package:flutter/material.dart';
import 'package:registration_app/skin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    count();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void count() {
    Timer(const Duration(seconds: 3), () {
      nextscreen();
    });
  }

  nextscreen() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const SkinScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/gas.jpg'),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Xush Kelibsiz',
                    style: TextStyle(color: Colors.cyan, fontSize: 32),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
