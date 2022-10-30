part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

class FetchDetaisEvent extends DetailsEvent{

  final String userId;
  final int standUpId;
  FetchDetaisEvent(this.userId, this.standUpId);

}
