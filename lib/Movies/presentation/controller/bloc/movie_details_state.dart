part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetailsMessage = '',
    this.movieDetailsState = RequestState.Loading,
    this.movieDetails,
    this.movieRecommedtionMessage = '',
    this.movieRecommedtionState = RequestState.Loading,
    this.movieRecommedtion = const [],
  });
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<MovieRecommedtion> movieRecommedtion;
  final RequestState movieRecommedtionState;
  final String movieRecommedtionMessage;
  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<MovieRecommedtion>? movieRecommedtion,
    RequestState? movieRecommedtionState,
    String? movieRecommedtionMessage,
  }) {
    return MovieDetailsState(
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieRecommedtion: movieRecommedtion ?? this.movieRecommedtion,
      movieRecommedtionState: movieRecommedtionState ?? this.movieDetailsState,
      movieRecommedtionMessage:
          movieRecommedtionMessage ?? this.movieRecommedtionMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailsState,
        movieDetails,
        movieDetailsMessage,
        movieRecommedtion,
        movieRecommedtionState,
        movieRecommedtionMessage,
      ];
}


// class MovieDetailsInitial extends MovieDetailsState {}
