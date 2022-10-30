import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geek_bot_client/logic/HomeBloc/home_bloc.dart';
import 'package:geek_bot_client/view/details/details_view.dart';

part 'home_view_body.dart';
part 'home_view_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              HeaderSection(),
              Divider(height: 4, thickness: 4),
              SizedBox(),
              ContentSection()
            ],
          ),
        ),
      ),
    );
  }
}
