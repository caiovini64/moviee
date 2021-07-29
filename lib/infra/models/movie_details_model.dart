import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/infra/models/models.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required int id,
    required String title,
    required posterPath,
    required backdropPath,
    required List<GenresModel> genres,
  }) : super(
          id: id,
          title: title,
          posterPath: posterPath,
          backdropPath: backdropPath,
          genres: genres,
        );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['original_title'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      genres: GenresModel.getGenres(json['genres']),
    );
  }
}
