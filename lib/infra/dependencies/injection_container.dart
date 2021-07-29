import 'package:get_it/get_it.dart';

import 'package:moviee/domain/repositories/repositories.dart';
import 'package:moviee/domain/usecases/usecases.dart';
import 'package:moviee/external/client/clients.dart';
import 'package:moviee/external/datasources/datasources.dart';
import 'package:moviee/infra/client/clients.dart';
import 'package:moviee/infra/datasources/datasources.dart';
import 'package:moviee/infra/repositories/repositories.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

final serviceLocator = GetIt.instance;

void init() {
  //Controllers
  serviceLocator.registerLazySingleton(
    () => HomeController(
      popularMoviesUsecase: serviceLocator<GetPopularMoviesUsecase>(),
      topRatedMoviesUsecase: serviceLocator<GetTopRatedMoviesUsecase>(),
      upcomingMoviesUsecase: serviceLocator<GetUpcomingMoviesUsecase>(),
      nowPlayingMoviesUsecase: serviceLocator<GetNowPlayingMoviesUsecase>(),
      movieDetailsUsecase: serviceLocator<GetMovieDetailsUsecase>(),
    ),
  );
  //Use cases
  serviceLocator.registerLazySingleton(
      () => GetMovieDetailsUsecase(serviceLocator<IMovieDetailsRepository>()));
  serviceLocator.registerLazySingleton(() => GetMovieRecommendationsUsecase(
      serviceLocator<IMovieRecommendationsRepository>()));
  serviceLocator.registerLazySingleton(() => GetNowPlayingMoviesUsecase(
      serviceLocator<INowPlayingMoviesRepository>()));
  serviceLocator.registerLazySingleton(() =>
      GetPopularMoviesUsecase(serviceLocator<IPopularMoviesRepository>()));
  serviceLocator.registerLazySingleton(() =>
      GetTopRatedMoviesUsecase(serviceLocator<ITopRatedMoviesRepository>()));
  serviceLocator.registerLazySingleton(() =>
      GetUpcomingMoviesUsecase(serviceLocator<IUpcomingMoviesRepository>()));

  //Repositories
  serviceLocator.registerLazySingleton<IMovieDetailsRepository>(
      () => MovieDetailsRepository(serviceLocator()));
  serviceLocator.registerLazySingleton<IMovieRecommendationsRepository>(
      () => MovieRecommendationsRepository(serviceLocator()));
  serviceLocator.registerLazySingleton<INowPlayingMoviesRepository>(
      () => NowPlayingMoviesRepository(serviceLocator()));
  serviceLocator.registerLazySingleton<IPopularMoviesRepository>(
      () => PopularMoviesRepository(serviceLocator()));
  serviceLocator.registerLazySingleton<ITopRatedMoviesRepository>(
      () => TopRatedMoviesRepository(serviceLocator()));
  serviceLocator.registerLazySingleton<IUpcomingMoviesRepository>(
      () => UpcomingMoviesRepository(serviceLocator()));

  //Datasources
  serviceLocator.registerLazySingleton<IMovieDetailsDatasource>(
      () => MovieDetailsDatasource(serviceLocator()));
  serviceLocator.registerLazySingleton<IMovieRecommendationsDatasource>(
      () => MovieRecommendationsDatasource(serviceLocator()));
  serviceLocator.registerLazySingleton<INowPlayingMoviesDatasource>(
      () => NowPlayingMoviesDatasource(serviceLocator()));
  serviceLocator.registerLazySingleton<IPopularMoviesDatasource>(
      () => PopularMoviesDatasource(serviceLocator()));
  serviceLocator.registerLazySingleton<ITopRatedMoviesDatasource>(
      () => TopRatedMoviesDatasource(serviceLocator()));
  serviceLocator.registerLazySingleton<IUpcomingMoviesDatasource>(
      () => UpcomingMoviesDatasource(serviceLocator()));

  //Clients
  serviceLocator.registerLazySingleton<IConnectionClient>(() => HttpClient());
}
