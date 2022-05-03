part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class FactLoadEvent extends HomeScreenEvent {}

class OnDetailFactsScreenRedirect extends HomeScreenEvent {}
