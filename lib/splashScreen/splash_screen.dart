import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goride/authentification/login-screen.dart';
import 'package:goride/authentification/signup-screen.dart';

import 'package:goride/mainScreens/main_screen.dart';



class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
{
  startTimer (){
    Timer(const Duration(seconds: 3),()async
    {
      //send the user to the home screen
      Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreen()));
    });
  }
  @override
  void initState() {

    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("Assets/logo.png"),
            const SizedBox(
              height:5.0,
            ),
            const Text(" Need a ride !  Just goride ",
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueAccent,
              fontWeight:FontWeight.w400,

            ),)
          ],
        ),
        ),

      ),
    );
  }
}
