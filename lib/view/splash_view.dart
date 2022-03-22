import 'dart:async';

import 'package:flutter/material.dart';

import 'movies_list_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int d = 3000;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: d),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MoviesListScreen(),
              ), (Route<dynamic> route) {
            return false;
          })
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Movies App',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueAccent),)
      ),
    );
  }
}
