import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/screens/login_screen.dart';
import 'package:quickcall/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Inria Sans',
      ),
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
      home: const Login(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What is your emergency',
            )
          ],
        ),
      ),
    );
  }
}
