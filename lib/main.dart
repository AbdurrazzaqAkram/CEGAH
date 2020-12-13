import 'package:flutter/material.dart';
import 'package:cegah_tim1/splash.dart';
import 'package:cegah_tim1/screens/cegah_bosan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEGAH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.white,
          primarySwatch: Colors.blue
      ),
      home: Splash(),
        routes: <String, WidgetBuilder> {
          '/home' : (BuildContext context) =>
              CegahBosan(),
        }
    );
  }
}
