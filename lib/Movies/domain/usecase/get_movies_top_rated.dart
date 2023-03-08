import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/data/models/movies_model.dart';
import 'package:movies_app/Movies/domain/entites/movies.dart';
import 'package:movies_app/Movies/domain/repesitory/base_movies_repeitory.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase< List<Movies>,NoParamter>{
final BaseMoviesRepeitory baseMoviesRepeitory;
  GetTopRatedMoviesUseCase(this.baseMoviesRepeitory);
  
  @override
  Future<Either<Failure, List<Movies>>> call(NoParamter paramter)async {
    return await baseMoviesRepeitory.getTopRatedMovies();
  }
//  Future<Either<Failure, List<MoviesModel>>> excute()async{
//   return await baseMoviesRepeitory.getTopRatedMovies();
//  }
}