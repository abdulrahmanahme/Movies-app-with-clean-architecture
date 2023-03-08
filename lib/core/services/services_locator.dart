import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/Movies/data/repesitory/resitory_movies_reomte.dart';
import 'package:movies_app/Movies/domain/repesitory/base_movies_repeitory.dart';
import 'package:movies_app/Movies/domain/usecase/get_movies_now_playing.dart';
import 'package:movies_app/Movies/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:movies_app/Movies/presentation/controller/movies_bloc.dart';

import '../../Movies/domain/usecase/get_movie_details.dart';
import '../../Movies/domain/usecase/get_movie_recommendtion.dart';
import '../../Movies/domain/usecase/get_movies_popular.dart';
import '../../Movies/domain/usecase/get_movies_top_rated.dart';

    final sl = GetIt.instance;

class ServicesLocator{
  void init(){
    /// BLOC
  sl.registerFactory(() => BlocMovies(sl() ,sl(),sl()));
  sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    /////UseCase
    sl.registerLazySingleton(() =>GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() =>GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() =>GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() =>BaseGetMovieDateilsUseCase(sl()));
    sl.registerLazySingleton(() =>MovieRecommendtionUseCase(sl()));



     // Repository
     sl.registerLazySingleton<BaseMoviesRepeitory>(() =>MoviesRepeitory(sl()) );
    //Data Source
    sl.registerLazySingleton<BaesMoviesRemoteDataSource>(() =>MoviesRemoteDataSource() );

  }
}