import 'package:flutter/material.dart';
import 'package:flutter_application_1stproject/detailsong.dart';
import 'package:flutter_application_1stproject/miniplayer.dart';

import 'package:flutter_application_1stproject/spalashscreen.dart';

import 'mainscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
