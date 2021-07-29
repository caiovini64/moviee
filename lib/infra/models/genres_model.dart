import 'package:get/get_utils/src/platform/platform_io.dart';
import 'package:moviee/domain/entities/entities.dart';

class GenresModel extends GenresEntity {
  final int id;
  final String name;

  GenresModel({
    required this.id,
    required this.name,
  }) : super(
          id: id,
          name: name,
        );

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<GenresModel> getGenres(List<dynamic> json) {
    if (json.isEmpty) {
      return [];
    } else {
      List<GenresModel> genres =
          json.map((genre) => GenresModel.fromJson(genre)).toList();
      return genres;
    }
  }
}
