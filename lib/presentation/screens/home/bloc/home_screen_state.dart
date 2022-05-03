part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenLoadedState extends HomeScreenState {
  final Fact fact;
  final Photo photo;

  HomeScreenLoadedState(
    this.fact,
    this.photo,
  );
}

class HomeScreenErrorState extends HomeScreenState {}

class RedirectToDetailFactsScreenState extends HomeScreenState {
  final List<DetailFact> detailFactsList;

  RedirectToDetailFactsScreenState(this.detailFactsList);
}
