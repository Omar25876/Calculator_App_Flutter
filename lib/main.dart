import 'package:flutter/material.dart';
import 'calculator_Screen.dart';

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
        CalculatorScreen.routeName:(context)=> CalculatorScreen(),

      },
      initialRoute:CalculatorScreen.routeName,
    );
  }
}
