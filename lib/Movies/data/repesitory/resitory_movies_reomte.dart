import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/Movies/data/models/movies_model.dart';
import 'package:movies_app/Movies/domain/entites/movie_details.dart';
import 'package:movies_app/Movies/domain/entites/movie_recommendtion.dart';
import 'package:movies_app/Movies/domain/entites/movies.dart';
import 'package:movies_app/Movies/domain/repesitory/base_movies_repeitory.dart';
import 'package:movies_app/Movies/domain/usecase/get_movie_recommendtion.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/server/expations.dart';

import '../../domain/usecase/get_movie_details.dart';
import '../models/movie_details.dart';

class MoviesRepeitory extends BaseMoviesRepeitory {
  final BaesMoviesRemoteDataSource baesMoviesRemoteDataSource;
  MoviesRepeitory(this.baesMoviesRemoteDataSource);
  @override
  Future<Either<Failure, List<Movies>>> getMoviesPlayingNow() async {
    final result = await baesMoviesRemoteDataSource.getMoviesPlayingNow();
    try {
      return right(result);
    } on ServerExtaion catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies() async {
    final result = await baesMoviesRemoteDataSource.getPopularMovies();
    try {
      return right(result);
    } on ServerExtaion catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies() async {
    final result = await baesMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return right(result);
    } on ServerExtaion catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

// MoviesDetailsModel
  @override
  Future<Either<Failure, MovieDetails>> getMovieDateils(
      MovieDetailsParamter  parameter) async {
    final result = await baesMoviesRemoteDataSource.getMovieDetails(parameter);
    try {
      return right(result);
    } on ServerExtaion catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List< MovieRecommedtion>>> getMovieRecomendtion(
      ParamterRecommendtion paramterRecommendtion) async {
    final result = await baesMoviesRemoteDataSource
        .getMovieRecommedtion(paramterRecommendtion);
    try {
      return right(result);
    } on ServerExtaion catch (failure) {
      return left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
