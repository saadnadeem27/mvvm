import 'dart:async';

import 'package:flutter/material.dart';

import '../view_model/services/splash_services.dart';
//import 'package:mvvm/view_model/services/splash_services.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  SplashServices splashServices = SplashServices();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
    // Timer(Duration(seconds: 3), () {
    //   //Navigator.pushNamed(context, routeName)
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash SCreen'),
      ),
    );
  }
}
