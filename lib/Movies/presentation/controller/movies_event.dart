import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable{
  const MoviesEvents();
  @override
  List<Object?> get props =>[
  ];
}
class GetMoviesPlayingNowEvent extends MoviesEvents{}
class GetMoviesPopularEvent extends MoviesEvents{}
class GetMoviesTopRatedEvent extends MoviesEvents{}
// class GetMovieDetails extends MoviesEvents{}

