import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String posterPath;

  MovieEntity({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
  });

  @override
  List<Object?> get props => [id, title, backdropPath, posterPath];
}