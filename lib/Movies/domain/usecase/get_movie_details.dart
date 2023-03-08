import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies/domain/entites/movie_details.dart';
import 'package:movies_app/Movies/domain/repesitory/base_movies_repeitory.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';

import '../../data/models/movie_details.dart';

class BaseGetMovieDateilsUseCase extends BaseUseCase<MovieDetails,MovieDetailsParamter> {
 final BaseMoviesRepeitory baseMoviesRepeitory;

 BaseGetMovieDateilsUseCase( this.baseMoviesRepeitory);
 
  @override
  Future<Either<Failure,MovieDetails>> call(MovieDetailsParamter paramter) async{
   return  await baseMoviesRepeitory.getMovieDateils(paramter);
  }

}
class MovieDetailsParamter extends Equatable{
 final int id;
 const MovieDetailsParamter({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];

}