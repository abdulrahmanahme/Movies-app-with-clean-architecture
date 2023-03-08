import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Movies/domain/entites/genres_movie.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final int id;
   final List<Genres>? genres;

  final String overview;
  final int runtime;
  final String title;
   final String releaseDate;
  final double voteAverage; 

  const MovieDetails({
    required this.backdropPath,
    required this.id,
    required this.genres,
    required this.overview,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        runtime,
        title,
        voteAverage,
        releaseDate,
      ];
}
