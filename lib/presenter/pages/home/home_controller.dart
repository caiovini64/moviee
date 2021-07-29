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
  final GetPopularMoviesUsecase _popularMoviesUsecase;
  final GetTopRatedMoviesUsecase _topRatedMoviesUsecase;
  final GetUpcomingMoviesUsecase _upcomingMoviesUsecase;
  final GetNowPlayingMoviesUsecase _nowPlayingMoviesUsecase;
  final GetMovieDetailsUsecase _movieDetailsUsecase;
  final GetMovieRecommendationsUsecase _movieRecommendationsUsecase;

  HomeController(
    this._topRatedMoviesUsecase,
    this._upcomingMoviesUsecase,
    this._nowPlayingMoviesUsecase,
    this._popularMoviesUsecase,
    this._movieDetailsUsecase,
    this._movieRecommendationsUsecase,
  );

  final moviesList = <MovieEntity>[].obs;
  final recommendedMoviesList = <MovieEntity>[].obs;

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
    description: '',
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
    everAll([_pageState, _movieSelected], (_) {
      print(_pageState.value);
      _loadData();
    });

    _loadData();
  }

  _loadData() async {
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
        return _loadDetailsParametes();
      default:
        return _loadPopularMovies();
    }
  }

  Future<void> _loadPopularMovies() async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await _popularMoviesUsecase(NoParams());
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
        await _topRatedMoviesUsecase(NoParams());
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
        await _upcomingMoviesUsecase(NoParams());
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
        await _nowPlayingMoviesUsecase(NoParams());
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
        await _movieDetailsUsecase(movieEntity);
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        _setState(ViewState.done);
        movieSelectedDetails = data;
        return movieSelectedDetails;
      },
    );
  }

  Future<void> _loadRecommendedMovies(MovieEntity movieEntity) async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await _movieRecommendationsUsecase(movieEntity);
    result.fold(
      (failure) {
        failureMessage = failure.message;
      },
      (data) {
        recommendedMoviesList.clear();
        recommendedMoviesList.addAll(data);
      },
    );
  }

  void _loadDetailsParametes() {
    _loadRecommendedMovies(movieSelected)
        .then((value) => _loadMovieDetails(movieSelected));
  }

  void tapSideBar() => isSideBarOpen = !isSideBarOpen;

  void _setState(ViewState state) => viewState = state;

  void updatePageState(PageState state) => pageState = state;

  void tapMovieCategories() =>
      isMoviesCategoriesSelected = !isMoviesCategoriesSelected;

  void setMovieSelected(MovieEntity movie) => movieSelected = movie;
}
