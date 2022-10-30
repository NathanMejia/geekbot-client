import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bc;
import 'package:geek_bot_client/data/client/http_client.dart';
import 'package:geek_bot_client/data/models/standup_responde_model.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {

  List<ReportStandupModel> currentReportStandup = [];

  final String apiKey;
  final HttpClient _httpClient = HttpClient();
  DetailsBloc(this.apiKey) : super(DetailsInitial()) {
    on<FetchDetaisEvent>((event, emit) async {
      emit(DetailLoadingState());
      final result =await _httpClient.reportStandUpRequest(apiKey, event.userId, event.standUpId);
      currentReportStandup = result;
      emit(DetailLoadingSuccesState());
    }, transformer: bc.droppable());
  }
}
