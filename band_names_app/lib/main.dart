import 'package:band_names_app/pages/home_page.dart';
import 'package:band_names_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'home': (_) => const HomePage(),
          'login': (_) => const LoginPage()
        },
    );
  }
}
