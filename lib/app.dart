
import 'package:bmi_calculator/view/pages/home.dart';
import 'package:bmi_calculator/view/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: getMaterialColor(swatch),
          scaffoldBackgroundColor: swatch,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              toolbarHeight: 100,
              centerTitle: true,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: swatch))),
      home: const MyHomePage(),
    );
  }
}
