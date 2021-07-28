import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:moviee/domain/entities/movie_entity.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/usecases/get_popular_movies.dart';
import 'package:moviee/presenter/helpers/helpers.dart';

class HomeController extends GetxController {
  final GetPopularMoviesUsecase popularMoviesUsecase;
  HomeController({required this.popularMoviesUsecase});

  final popularMoviesList = <MovieEntity>[].obs;
  final _viewState = ViewState.initial.obs;
  final _failureMessage = ''.obs;
  final _isSidebarOpen = false.obs;

  String get failureMessage => _failureMessage.value;
  ViewState get viewState => _viewState.value;
  bool get isSideBarOpen => _isSidebarOpen.value;

  set failureMessage(message) => _failureMessage.value = message;
  set viewState(state) => _viewState.value = state;
  set isSideBarOpen(state) => _isSidebarOpen.value = state;

  @override
  void onInit() {
    super.onInit();
    loadPopularMovies();
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
        popularMoviesList.addAll(data);
      },
    );
  }

  void tapSideBar() {
    isSideBarOpen = !isSideBarOpen;
  }

  void _setState(ViewState state) {
    viewState = state;
  }
}
