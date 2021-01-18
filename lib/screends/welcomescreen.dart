import 'dart:async';
import 'package:beritasttb/screends/Loginscreen.dart';
import 'package:beritasttb/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'onboarding_screen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 4000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => Wrapper()));
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue[400]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
            image: DecorationImage(
                image: AssetImage('asset/image/background.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Text(
                'STTB NEWS',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 260,
                child: Image(image: AssetImage('asset/image/vektor.png')),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Selamat Datang ^^',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(
                height: 150,
              ),
              new LinearPercentIndicator(
                animation: true,
                alignment: MainAxisAlignment.center,
                width: 240.0,
                lineHeight: 4.0,
                percent: 1.0,
                animationDuration: 2250,
                backgroundColor: Colors.grey,
                progressColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
