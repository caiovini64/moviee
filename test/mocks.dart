import 'package:mocktail/mocktail.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/external/client/clients.dart';
import 'package:moviee/infra/models/models.dart';

class HttpClientMock extends Mock implements HttpClient {}

final kMovieEntityList = [
  MovieEntity(id: 1, title: '', backdropPath: '', posterPath: ''),
  MovieEntity(id: 1, title: '', backdropPath: '', posterPath: ''),
  MovieEntity(id: 1, title: '', backdropPath: '', posterPath: ''),
];

final kMovieEntity =
    MovieEntity(id: 1, title: '', backdropPath: '', posterPath: '');

final kMovieModelList = [
  MovieModel(
    id: 1,
    title: '',
    genreIds: [],
    backdropPath: '',
    posterPath: '',
  ),
  MovieModel(
    id: 1,
    title: '',
    genreIds: [],
    backdropPath: '',
    posterPath: '',
  ),
];

final kMovieDetailsModel = MovieDetailsModel(
  id: 297761,
  title: '',
  backdropPath: '',
  genres: <GenresModel>[],
  posterPath: '',
);

final kMovieDetailsResponse =
    '''{"id": 1,"original_title": "","genres": [{"id": 18,"name": "Drama"},{"id": 18,"name": "Drama"}],"backdrop_path": "","poster_path": ""}''';
