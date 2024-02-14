import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_p_9/screens/home.dart';
import 'package:shared_p_9/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  void isLogin() async {
    // ignore: unused_local_variable
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;

    if (isLogin) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Image(
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              'https://images.pexels.com/photos/459335/pexels-photo-459335.jpeg')),
    );
  }
}
