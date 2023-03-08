import 'dart:ffi';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies/domain/entites/movie_recommendtion.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import '../../../core/failure/failure.dart';
import '../repesitory/base_movies_repeitory.dart';

class MovieRecommendtionUseCase  extends BaseUseCase<List<MovieRecommedtion>,ParamterRecommendtion>{
 final BaseMoviesRepeitory baseMoviesRepeitory;

 MovieRecommendtionUseCase(this.baseMoviesRepeitory);
  @override
  Future<Either<Failure,List<MovieRecommedtion>>> call(ParamterRecommendtion recomendparamter)async{
    return await baseMoviesRepeitory.getMovieRecomendtion( recomendparamter);
   }
} 
class ParamterRecommendtion extends Equatable{
 final int id;
 const ParamterRecommendtion(this.id);
  
  @override
  // TODO: implement props
  List<Object?> get props =>[id];

}