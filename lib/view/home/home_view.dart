import 'package:flutter/material.dart';

part 'home_view_body.dart';
part 'home_view_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            HeaderSection()
          ],
        ),
      ),
    );
  }
}

