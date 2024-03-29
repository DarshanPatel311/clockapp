import 'package:clockapp/homeScreen.dart';
import 'package:clockapp/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    routes: {
      '/':(context)=>Clock(),
      '/stopwatch':(context)=>  stopwatch(),
      '/Timer':(context)=>  Timer(),
    },
    );
  }
}
