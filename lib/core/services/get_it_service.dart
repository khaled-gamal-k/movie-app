import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/features/Movies/presentation/cubit/cubit/recommendations_cubit.dart';
import '../../features/Movies/data/repos/movie_repo_impl.dart';
import '../../features/Movies/domain/repos/movie_repo.dart';

import '../../features/Movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import '../../features/Movies/presentation/cubit/movie_details_cubit/movie_details_cubit.dart';
import '../../features/Movies/presentation/cubit/popular_cubit/popular_cubit.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  _setupServices();
  _setupRepos();
  _setupCubits();
}

void _setupServices() {
  getIt.registerLazySingleton<Dio>(() => DioFactory.dio);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));
}

void _setupRepos() {
  getIt.registerLazySingleton<MovieRepo>(() => MovieRepoImpl(getIt()));
}

void _setupCubits() {
  getIt.registerFactory<MovieCubit>(() => MovieCubit(getIt()));
  getIt.registerFactory<MovieDetailsCubit>(() => MovieDetailsCubit(getIt()));
  getIt.registerFactory<PopularMoviesCubit>(() => PopularMoviesCubit(getIt()));
  getIt.registerFactory<RecommendationsCubit>(() => RecommendationsCubit(getIt()));
}
