import 'package:after_layout/after_layout.dart';
import 'package:example1/home/base_page.dart';
import 'package:example1/pages/login_page.dart';
import 'package:example1/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:shimmer/shimmer.dart';

// import 'MainHome.dart';
// import 'LoginHome.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(opacity: 0.5, child: Image.asset("assets/img/bg.png")),
            Shimmer.fromColors(
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xff1e00ff),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Shopee',
                  style: TextStyle(
                      fontSize: 90.0,
                      fontFamily: "Pacifico",
                      shadows: <Shadow>[
                        Shadow(
                            blurRadius: 18.0,
                            color: Colors.black87,
                            offset: Offset.fromDirection(120, 12))
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



  @override
  Future<void> initState(){
    super.initState();
    _mockCheckForSession().then((value) =>
    Provider.of<LoginStore>(context, listen: false).isAlreadyAuthenticated().then((result) {
      if (result && value) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const BasePage()), (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const LoginPage()), (Route<dynamic> route) => false);
      }
    }));
  }
}





