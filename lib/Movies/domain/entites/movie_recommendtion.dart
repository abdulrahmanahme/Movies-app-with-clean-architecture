import 'package:equatable/equatable.dart';

class MovieRecommedtion extends Equatable {
  final int id;
  final String ?backdropPath;

  const MovieRecommedtion({required this.id, this.backdropPath});

  @override
  // TODO: implement props
  List<Object?> get props => [id,backdropPath];
}
