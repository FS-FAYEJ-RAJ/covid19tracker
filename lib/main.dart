import 'package:covidapp/model/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CovidApp());
}
class CovidApp extends StatelessWidget {
  const CovidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'covid app demo',
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home:SplassScreen()
    );
  }
}



