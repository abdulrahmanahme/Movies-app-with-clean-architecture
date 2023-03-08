import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/data/models/movies_model.dart';
import 'package:movies_app/Movies/domain/entites/movies.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import '../repesitory/base_movies_repeitory.dart';
class GetPopularMoviesUseCase  extends BaseUseCase<List<Movies>,NoParamter>{
final BaseMoviesRepeitory baseMoviesRepeitory;
  GetPopularMoviesUseCase(this.baseMoviesRepeitory);
  
  @override
  Future<Either<Failure, List<Movies>>> call(NoParamter paramter)async {
  return await baseMoviesRepeitory.getPopularMovies();

  }
}