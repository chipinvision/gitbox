////////////////////////////////////////////
// Instagram: @invisionchip
// Github: https://github.com/chipinvision
// LinkedIn: https:/linkedin.com/invisionchip
////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:gitbox/view/gitbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitBox',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const GitBox(),
    );
  }
}