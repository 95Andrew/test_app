import 'package:app/data/services/api_services.dart';
import 'package:app/data/entity/detail_fact.dart';
import 'package:app/data/response/fact_response/fact_response.dart';
import 'package:app/data/response/photo_response/photo_response.dart';
import 'package:app/data/services/hive_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final ApiService _apiService;
  final HiveService _hiveService;

  HomeScreenBloc(
    this._apiService,
    this._hiveService,
  ) : super(HomeScreenInitialState()) {
    on<FactLoadEvent>(
      (event, emit) async {
        emit(HomeScreenLoadingState());
        try {
          final Fact fact = await _apiService.getFact();
          final Photo photo = await _apiService.getPhoto();
          await _hiveService.saveDetailFact(
            DetailFact(
              description: fact.text ?? '',
              data: fact.createdAt ?? '',
            ),
          );
          emit(HomeScreenLoadedState(fact, photo));
        } catch (_) {
          emit(HomeScreenErrorState());
        }
      },
    );

    on<OnDetailFactsScreenRedirect>(
      (event, emit) async {
        try {
          final List<DetailFact> listDetailFacts = await _hiveService.getDetailFactsList();
          emit(
            RedirectToDetailFactsScreenState(listDetailFacts),
          );
        } catch (_) {
          emit(HomeScreenErrorState());
        }
      },
    );
  }
}
