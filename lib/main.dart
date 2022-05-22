import 'package:flutter/material.dart';
import 'package:sft_project/page/splash_screen/splash_screen_page.dart';
import 'package:sft_project/routes/custom_routes.dart';
import 'package:sft_project/routes/screen_argument.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRoutes.allRoutes,
      home: SplashScreenPage(data: ScreenArguments(arg1: '', arg2: '')),
    );
  }
}

