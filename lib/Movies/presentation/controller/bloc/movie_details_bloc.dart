import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies/domain/entites/movie_details.dart';
import 'package:movies_app/Movies/domain/entites/movie_recommendtion.dart';
import '../../../../core/enums/enums.dart';
import '../../../domain/usecase/get_movie_details.dart';
import '../../../domain/usecase/get_movie_recommendtion.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final BaseGetMovieDateilsUseCase baseGetMovieDateilsUseCase;
  final MovieRecommendtionUseCase getmovieRecommendtion;
  MovieDetailsBloc(this.baseGetMovieDateilsUseCase, this.getmovieRecommendtion)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecomendtionEvent>(_getMovieRecommedtion);
  }
  
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await baseGetMovieDateilsUseCase(MovieDetailsParamter(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetailsState: RequestState.Loaded,
              movieDetails: r,
            )));
  }

  FutureOr<void> _getMovieRecommedtion(
      GetMovieRecomendtionEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getmovieRecommendtion(ParamterRecommendtion(event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieRecommedtionState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieRecommedtionState: RequestState.Loaded,
              movieRecommedtion: r,
            )));
  }
}
