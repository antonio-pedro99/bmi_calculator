import 'package:bmi_calculator/app.dart';
import 'package:bmi_calculator/controllers/objectbox.dart';
import 'package:bmi_calculator/providers/person.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late ObjectBox localStorage;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  localStorage = await ObjectBox.create();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PersonProvider()),
    ],
    child: const MyApp(),
  ));
}
