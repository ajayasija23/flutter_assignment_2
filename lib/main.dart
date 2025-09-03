import 'package:card_connect/home_page.dart';
import 'package:card_connect/user_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String descrption="Experienced Android Developer | Expert in Android, Kotlin, Java, and More Passionate about crafting innovative mobile experiences, I bring a wealth of expertise in Android development, with proficiency in Kotlin, Java, MVVM architecture, PHP, MySQL, and Laravel.";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home:HomePage()
    );
  }
}

