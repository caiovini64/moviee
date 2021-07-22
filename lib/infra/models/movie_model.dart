import 'package:moviee/domain/entities/entities.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required int id,
    required String title,
    required List genreIds,
    required posterPath,
    required backdropPath,
  }) : super(
          id: id,
          title: title,
          posterPath: posterPath,
          backdropPath: backdropPath,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['original_title'],
      genreIds: json['genre_ids'],
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
    );
  }
}
