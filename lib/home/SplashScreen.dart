import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/AppConfigProvider.dart';
import 'package:todo_app/home/HomeScreen.dart';
import 'package:todo_app/home/MyTheme.dart';

class SplashScreen extends StatelessWidget{
  static const String routeName = 'Splash-Screen';

  @override
    @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    Timer( Duration(seconds: 3 ), () {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
    });

    // TODO: implement build
    return Scaffold(
      backgroundColor: provider.isDarkMode()?
      MyTheme.backgroundDark :
      MyTheme.backgroundLight ,
      body: Center(
          child: Image.asset("assets/images/logo.png",)),
    );
  }
}