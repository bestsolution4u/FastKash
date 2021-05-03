import 'package:fastkash/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('asset/image/splash_icon.png', width: 150, height: 150,),
            Text("FastKash", style: TextStyle(color: AppTheme.purple, fontSize: 48, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    ));
  }
}
