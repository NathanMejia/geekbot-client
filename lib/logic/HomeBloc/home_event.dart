part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class InitHomeEvent extends HomeEvent {
  final String apiKey;
  InitHomeEvent(this.apiKey);
}
