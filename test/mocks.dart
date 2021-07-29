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

final kMovieDetailsEntity = MovieDetailsEntity(
  id: 297761,
  title: '',
  backdropPath: '',
  genres: <GenresEntity>[],
  posterPath: '',
);

final kMovieDetailsResponse =
    '''{"id": 1,"original_title": "","genres": [{"id": 18,"name": "Drama"},{"id": 18,"name": "Drama"}],"backdrop_path": "","poster_path": ""}''';
final kMoviesResponse = ''' 
{
  "page": 1,
  "results": [
    {
      "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
      "adult": false,
      "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
      "release_date": "2016-08-03",
      "genre_ids": [
        14,
        28,
        80
      ],
      "id": 297761,
      "original_title": "Suicide Squad",
      "original_language": "en",
      "title": "Suicide Squad",
      "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
      "popularity": 48.261451,
      "vote_count": 1466,
      "video": false,
      "vote_average": 5.91
    }
  ]
}
''';
