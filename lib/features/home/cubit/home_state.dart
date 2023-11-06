part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class DetialsLoaded extends HomeState {}
class DetialsLoading extends HomeState {}
