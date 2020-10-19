import 'package:connectivity/connectivity.dart';
import 'package:example1/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:example1/pages/splash_page.dart';
import 'package:example1/stores/login_store.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([   //// Porrait mode ochiradi
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => LoginStore(),
        )
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}



