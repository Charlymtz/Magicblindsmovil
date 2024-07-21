import 'package:flutter/material.dart';
import 'package:magicblinds/pages/home_page.dart';
import 'package:magicblinds/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/":(context) => WelcomePage(),
        "/HomePage":(context) => HomePage(),

      },
    );
  }
}
