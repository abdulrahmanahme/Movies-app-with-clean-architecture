import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/failure/failure.dart';

abstract class BaseUseCase<T, Paramter> {
  Future<Either<Failure, T>> call(Paramter paramter);
}

class NoParamter extends Equatable {
  const NoParamter();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
