import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geek_bot_client/data/client/http_client.dart';
import 'package:geek_bot_client/data/models/standup_responde_model.dart';
import 'package:geek_bot_client/data/models/user_model.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bc;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  List<UserModel> currentsUserModel = [];
  List<StandupModel> currentsStandUpModel = [];
  String? currentApiKey;

  final _httpClient = HttpClient();

  HomeBloc() : super(HomeInitial()) {
    on<InitHomeEvent>((event, emit) async {
      emit(LoadingHomeState());
      final result = await _httpClient.homeScreenRequest(event.apiKey.trim());
      currentsUserModel = result;
      final resultQuestions = await _httpClient.standUpRequest(event.apiKey.trim());
      currentsStandUpModel = resultQuestions;
      currentApiKey = event.apiKey;
      emit(LoadingSuccessHomeState());   
    },transformer: bc.droppable() );
  }
}
