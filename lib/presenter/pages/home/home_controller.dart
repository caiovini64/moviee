import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
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
}

class HomeController extends GetxController {
  final GetPopularMoviesUsecase popularMoviesUsecase;
  final GetTopRatedMoviesUsecase topRatedMoviesUsecase;
  final GetUpcomingMoviesUsecase upcomingMoviesUsecase;
  final GetNowPlayingMoviesUsecase nowPlayingMoviesUsecase;

  HomeController({
    required this.topRatedMoviesUsecase,
    required this.upcomingMoviesUsecase,
    required this.nowPlayingMoviesUsecase,
    required this.popularMoviesUsecase,
  });

  final moviesList = <MovieEntity>[].obs;

  final _viewState = ViewState.initial.obs;
  final _pageState = PageState.home.obs;
  final _failureMessage = ''.obs;
  final _isSidebarOpen = false.obs;

  String get failureMessage => _failureMessage.value;
  ViewState get viewState => _viewState.value;
  PageState get pageState => _pageState.value;
  bool get isSideBarOpen => _isSidebarOpen.value;

  set failureMessage(message) => _failureMessage.value = message;
  set viewState(state) => _viewState.value = state;
  set pageState(state) => _pageState.value = state;
  set isSideBarOpen(state) => _isSidebarOpen.value = state;

  @override
  void onInit() {
    super.onInit();

    loadData();
  }

  Future<void> loadData() async {
    switch (pageState) {
      case PageState.home:
        return loadPopularMovies();
      case PageState.popular:
        return loadPopularMovies();
      case PageState.topRated:
        return loadTopRatedMovies();
      case PageState.upcoming:
        return loadUpcomingMovies();
      case PageState.nowPlaying:
        return loadNowPlayingMovies();
      default:
        return loadPopularMovies();
    }
  }

  Future<void> loadPopularMovies() async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await popularMoviesUsecase(NoParams());
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        _setState(ViewState.done);
        moviesList.addAll(data);
      },
    );
  }

  Future<void> loadTopRatedMovies() async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await topRatedMoviesUsecase(NoParams());
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        _setState(ViewState.done);
        moviesList.addAll(data);
      },
    );
  }

  Future<void> loadUpcomingMovies() async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await upcomingMoviesUsecase(NoParams());
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        _setState(ViewState.done);
        moviesList.addAll(data);
      },
    );
  }

  Future<void> loadNowPlayingMovies() async {
    _setState(ViewState.loading);
    final Either<Failure, List<MovieEntity>> result =
        await nowPlayingMoviesUsecase(NoParams());
    result.fold(
      (failure) {
        _setState(ViewState.error);
        failureMessage = failure.message;
      },
      (data) {
        _setState(ViewState.done);
        moviesList.addAll(data);
      },
    );
  }

  void tapSideBar() => isSideBarOpen = !isSideBarOpen;

  void _setState(ViewState state) => viewState = state;

  void updatePageState(PageState state) => pageState = state;
}
