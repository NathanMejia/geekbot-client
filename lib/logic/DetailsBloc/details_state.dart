part of 'details_bloc.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}
class DetailLoadingState extends DetailsState {}
class DetailLoadingSuccesState extends DetailsState {}
