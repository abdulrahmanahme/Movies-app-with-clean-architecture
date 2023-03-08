import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/Movies/data/repesitory/resitory_movies_reomte.dart';
import 'package:movies_app/Movies/domain/repesitory/base_movies_repeitory.dart';
import 'package:movies_app/Movies/domain/usecase/get_movies_now_playing.dart';
import 'package:movies_app/Movies/presentation/controller/movies_event.dart';
import 'package:movies_app/Movies/presentation/controller/movies_states.dart';
import 'package:movies_app/core/enums/enums.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';

import '../../domain/usecase/get_movies_popular.dart';
import '../../domain/usecase/get_movies_top_rated.dart';

class BlocMovies extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  

  BlocMovies(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesStates()) {
    // BaesMoviesRemoteDataSource baesMoviesRemoteDataSource =
    //     MoviesRemoteDataSource();
    // BaseMoviesRepeitory baseMoviesRepeitory =
    //     MoviesRepeitory(baesMoviesRemoteDataSource);
    on<GetMoviesPlayingNowEvent>(getNowPlayingMovies);

    on<GetMoviesPopularEvent>(getPopularMovies);

    on<GetMoviesTopRatedEvent>(getTopRatedMovies);
  }

  FutureOr<void> getPopularMovies(event, emit) async {
    var result = await getPopularMoviesUseCase(const NoParamter() );
    result.fold((l) {
      emit(state.copyWith(
          popularState: RequestState.error, getpopulaMessageError: l.message));
    }, (r) {
      emit(state.copyWith(
          popularState: RequestState.Loaded, getPopularMovies: r));
    });
  }

  FutureOr<void> getTopRatedMovies(event, emit) async {
    var result = await getTopRatedMoviesUseCase(const NoParamter());
    result.fold((l) {
      emit(state.copyWith(
          topRatedState: RequestState.error,
          getTopRatedMessageError: l.message));
    }, (r) {
      emit(state.copyWith(
        topRatedState: RequestState.Loaded, getTopRatedMovies: r));
    });
  }

  FutureOr<void> getNowPlayingMovies(event, emit) async {
    var result = await getNowPlayingMoviesUseCase(const NoParamter());
    result.fold(
        (l) => emit(
              state.copyWith(
                  nowPlayingState: RequestState.error,
                  playingNowMessageError: l.message),
            ), (r) {
      emit(state.copyWith(
        nowPlayingState: RequestState.Loaded,
        getMoviesPlayingNow: r,
      ));
    });
    //print('from bloc ${result}');
  }
}
