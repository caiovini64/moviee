import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/entities/movie_entity.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/usecases/usecases.dart';
import 'package:moviee/presenter/helpers/helpers.dart';

enum PageState {
  home,
  favorites,
  popular,
  topRated,
  upcoming,
  nowPlaying,
  info,
  details,
}

class HomeController extends GetxController {
  final GetPopularMoviesUsecase popularMoviesUsecase;
  final GetTopRatedMoviesUsecase topRatedMoviesUsecase;
  final GetUpcomingMoviesUsecase upcomingMoviesUsecase;
  final GetNowPlayingMoviesUsecase nowPlayingMoviesUsecase;
  final GetMovieDetailsUsecase movieDetailsUsecase;

  HomeController({
    required this.topRatedMoviesUsecase,
    required this.upcomingMoviesUsecase,
    required this.nowPlayingMoviesUsecase,
    required this.popularMoviesUsecase,
    required this.movieDetailsUsecase,
  });

  final moviesList = <MovieEntity>[].obs;

  final _viewState = ViewState.initial.obs;
  final _pageState = PageState.home.obs;
  final _failureMessage = ''.obs;
  final _isSidebarOpen = false.obs;
  final _isMoviesCategoriesSelected = false.obs;

  final _movieSelected =
      MovieEntity(title: '', backdropPath: '', id: 0, posterPath: '').obs;

  final _movieSelectedDetails = MovieDetailsEntity(
    title: '',
    backdropPath: '',
    id: 0,
    posterPath: '',
    genres: [],
  ).obs;

  String get failureMessage => _failureMessage.value;
  ViewState get viewState => _viewState.value;
  PageState get pageState => _pageState.value;
  bool get isSideBarOpen => _isSidebarOpen.value;
  bool get isMoviesCategoriesSelected => _isMoviesCategoriesSelected.value;
  MovieEntity get movieSelected => _movieSelected.value;
  MovieDetailsEntity get movieSelectedDetails => _movieSelectedDetails.value;

  set failureMessage(message) => _failureMessage.value = message;
  set viewState(state) => _viewState.value = state;
  set pageState(state) => _pageState.value = state;
  set isSideBarOpen(state) => _isSidebarOpen.value = state;
  set isMoviesCategoriesSelected(newValue) =>
      _isMoviesCategoriesSelected.value = newValue;
  set movieSelected(movie) => _movieSelected.value = movie;
  set movieSelectedDetails(movie) => _movieSelectedDetails.value = movie;

  @override
  void onInit() {
    super.onInit();
    ever(_pageState, (_) {
      print(_pageState.value);
      _loadData();
    });
    _loadData();
  }

  Future<void> _loadData() async {
    switch (pageState) {
      case PageState.home:
        return _loadPopularMovies();
      case PageState.popular:
        return _loadPopularMovies();
      case PageState.topRated:
        return _loadTopRatedMovies();
      case PageState.upcoming:
        return _loadUpcomingMovies();
      case PageState.nowPlaying:
        return _loadNowPlayingMovies();
      case PageState.details:
        return _loadMovieDetails(movieSelected);
      default:
        return _loadPopularMovies();
    }
  }

  Future<void> _loadPopularMovies() async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await popularMoviesUsecase(NoParams());
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        moviesList.clear();
        moviesList.addAll(data);
        _setState(ViewState.done);
      },
    );
  }

  Future<void> _loadTopRatedMovies() async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await topRatedMoviesUsecase(NoParams());
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        moviesList.clear();
        moviesList.addAll(data);
        _setState(ViewState.done);
      },
    );
  }

  Future<void> _loadUpcomingMovies() async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await upcomingMoviesUsecase(NoParams());
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        moviesList.clear();
        moviesList.addAll(data);
        _setState(ViewState.done);
      },
    );
  }

  Future<void> _loadNowPlayingMovies() async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await nowPlayingMoviesUsecase(NoParams());
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        moviesList.clear();
        moviesList.addAll(data);
        _setState(ViewState.done);
      },
    );
  }

  Future<void> _loadMovieDetails(MovieEntity movieEntity) async {
    _setState(ViewState.loading);
    final Either<Failure, MovieDetailsEntity> result =
        await movieDetailsUsecase(movieEntity);
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        movieSelectedDetails = data;
        _setState(ViewState.done);
        return movieSelectedDetails;
      },
    );
  }

  void tapSideBar() => isSideBarOpen = !isSideBarOpen;

  void _setState(ViewState state) => viewState = state;

  void updatePageState(PageState state) => pageState = state;

  void tapMovieCategories() =>
      isMoviesCategoriesSelected = !isMoviesCategoriesSelected;

  void setMovieSelected(MovieEntity movie) => movieSelected = movie;
}
