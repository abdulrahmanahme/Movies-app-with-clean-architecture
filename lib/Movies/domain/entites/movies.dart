import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final double voteAverage;
  final List<int> genreIds;
  final int id;
  final String overview;
  final String posterPath;
  final String title;
  final String releaseDate;

  const Movies(
      {required this.id,
      required this.voteAverage,
      required this.genreIds,
      required this.overview,
      required this.posterPath,
      required this.title,
      required this.releaseDate,
      });

  @override
  List<Object?> get props =>[
    id,
    voteAverage,
    genreIds,
    overview,
    posterPath,
    title,
    releaseDate
  ];
}
