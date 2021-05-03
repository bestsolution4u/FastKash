import 'package:fastkash/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppTheme.purple, statusBarIconBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: AppTheme.purple,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                ),
              ))
        ],
      ),
    );
  }
}
