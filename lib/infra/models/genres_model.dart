class GenresModel {
  final int id;
  final String name;

  GenresModel({required this.id, required this.name});

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
