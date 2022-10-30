
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geek_bot_client/data/models/standup_responde_model.dart';
import 'package:geek_bot_client/data/models/user_model.dart';
import 'package:geek_bot_client/logic/DetailsBloc/details_bloc.dart';

part 'details_header.dart';
part 'details_content.dart';

class DetailsView extends StatelessWidget {
  final UserModel userModel;
  final List<StandupModel> standupModel;
  final String apiKey;
  const DetailsView(
      {super.key,
      required this.userModel,
      required this.standupModel,
      required this.apiKey});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc(apiKey),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              HeaderSection(userModel: userModel, standups: standupModel),
              const ContentSection()
            ],
          ),
        ),
      ),
    );
  }
}
