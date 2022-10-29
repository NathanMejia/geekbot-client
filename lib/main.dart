import 'package:flutter/material.dart';
import 'package:geek_bot_client/view/home/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Geek Bot Client',
      home: const HomeView(),
      theme: ThemeData.dark(),
    );
  }
}