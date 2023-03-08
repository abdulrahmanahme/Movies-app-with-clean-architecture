import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies/domain/entites/movie_details.dart';
import 'package:movies_app/Movies/domain/entites/movies.dart';
import 'package:movies_app/core/enums/enums.dart';

class MoviesStates extends Equatable {
  final List<Movies> getMoviesPlayingNow;
  final RequestState nowPlayingState;
  final String playingNowMessageError;
  final List<Movies> getTopRatedMovies;
  final RequestState topRatedState;
  final String getTopRatedMessageError;
  final List<Movies> getPopularMovies;
  final RequestState popularState;
  final String getpopulaMessageError;

  const MoviesStates({
    this.getMoviesPlayingNow = const [],
    this.nowPlayingState = RequestState.Loading,
    this.playingNowMessageError = '',
    this.topRatedState = RequestState.Loading,
    this.getTopRatedMovies = const [],
    this.getTopRatedMessageError = '',
    this.getPopularMovies = const [],
    this.getpopulaMessageError = '',
    this.popularState = RequestState.Loading,
  });
  MoviesStates copyWith({
    final List<Movies>? getMoviesPlayingNow,
    RequestState? nowPlayingState,
    String? playingNowMessageError,
    List<Movies>? getTopRatedMovies,
    RequestState? topRatedState,
    String? getTopRatedMessageError,
    List<Movies>? getPopularMovies,
    RequestState? popularState,
    String? getpopulaMessageError,
  }) {
    return MoviesStates(
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      getMoviesPlayingNow: getMoviesPlayingNow ?? this.getMoviesPlayingNow,
      getTopRatedMovies: getTopRatedMovies ?? this.getTopRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      getTopRatedMessageError:getTopRatedMessageError ?? this.getTopRatedMessageError,
      getPopularMovies: getPopularMovies ?? this.getPopularMovies,
      popularState: popularState??this.popularState,
      getpopulaMessageError:
          getpopulaMessageError ?? this.getTopRatedMessageError,
    );
  }

  // = MovieDetails(
  //     backdropPath: '',
  //     id: '',
  //     genres: '',
  //     overview: '',
      
  //     runtime: ''
  //     title: '',
  //     v
  //   );

  @override
  // TODO: implement props
  List<Object?> get props => [
        getMoviesPlayingNow,
        nowPlayingState,
        playingNowMessageError,
        getTopRatedMovies,
        topRatedState,
        getTopRatedMessageError,
        getPopularMovies,
        popularState,
        getpopulaMessageError
      ];
}
