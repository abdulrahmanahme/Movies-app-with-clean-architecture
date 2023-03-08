import 'package:dio/dio.dart';
import 'package:movies_app/Movies/data/datasource/network/app_constance.dart';
import 'package:movies_app/Movies/data/datasource/network/error_message_model.dart';
import 'package:movies_app/Movies/data/models/movie_details.dart';
import 'package:movies_app/Movies/data/models/movie_recommendtion.dart';
import 'package:movies_app/Movies/data/models/movies_model.dart';
import 'package:movies_app/Movies/domain/entites/movie_details.dart';
import 'package:movies_app/core/server/expations.dart';

import '../../domain/entites/movies.dart';
import '../../domain/usecase/get_movie_details.dart';
import '../../domain/usecase/get_movie_recommendtion.dart';

abstract class BaesMoviesRemoteDataSource {
  Future<List<MoviesModel>> getMoviesPlayingNow();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MoviesDetailsModel> getMovieDetails(MovieDetailsParamter movieId);
  Future<List<MovieRecommedtionModel>> getMovieRecommedtion(ParamterRecommendtion movieId);
}

class MoviesRemoteDataSource extends BaesMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getMoviesPlayingNow() async {
    final response = await Dio().get(ApiConstance.getNowPlaying);
    if (response.statusCode == 200) {
      return List.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerExtaion(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.getPopular);
    if (response.statusCode == 200) {
      return List.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerExtaion(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0');
    if (response.statusCode == 200) {
      return List.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerExtaion(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MoviesDetailsModel> getMovieDetails(
      MovieDetailsParamter movieId) async {
    final response = await Dio().get(ApiConstance.getMovieId(movieId.id));
    if (response.statusCode == 200) {
         var data  =MoviesDetailsModel.fromJson(response.data);
    print('movie details  $data ');
      return  data;
      // return List.from((response.data["results"] as List)
      //     .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerExtaion(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieRecommedtionModel>> getMovieRecommedtion(
      ParamterRecommendtion movieId) async {
    final response = await Dio().get(ApiConstance.getRecommendMovieId(movieId.id));
    if (response.data == 200) {
      return List.from((response.data["results" ]as List).map((e)=> MovieRecommedtionModel.fromJson(e)));
     
    } else {
      throw throw ServerExtaion(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
