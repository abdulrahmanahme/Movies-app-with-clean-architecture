import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/data/models/movies_model.dart';
import 'package:movies_app/Movies/domain/entites/movie_details.dart';
import 'package:movies_app/Movies/domain/entites/movie_recommendtion.dart';
import 'package:movies_app/Movies/domain/entites/movies.dart';
import 'package:movies_app/Movies/domain/usecase/get_movie_recommendtion.dart';
import 'package:movies_app/Movies/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:movies_app/core/failure/failure.dart';

import '../../data/models/movie_details.dart';
import '../usecase/get_movie_details.dart';

abstract class BaseMoviesRepeitory{
  Future<Either<Failure, List<Movies>>>getMoviesPlayingNow();
  Future<Either<Failure, List<Movies>>>getPopularMovies();
  Future<Either<Failure, List<Movies>>>getTopRatedMovies();
  Future<Either<Failure, MovieDetails>>getMovieDateils(MovieDetailsParamter paramte);
  Future<Either<Failure, List<MovieRecommedtion>>>getMovieRecomendtion(ParamterRecommendtion  paramterRecommendtion);


}