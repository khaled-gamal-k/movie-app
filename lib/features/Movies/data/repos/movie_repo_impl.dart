import 'package:dartz/dartz.dart';
import '../../../../core/network/endpoints.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_service.dart';
import '../../domain/repos/movie_repo.dart';
import '../models/movie_details_model/movie_details_model.dart';
import '../models/movies_model.dart';
import '../models/trailer_model.dart';

class MovieRepoImpl extends MovieRepo {
  final ApiService _apiService;

  MovieRepoImpl(this._apiService);
  @override
  Future<Either<ApiErrorHandler, MovieDetailsModel>> getMovieDetails(
    int movieId,
  ) async {
    try {
      final response = await _apiService.getMovieDetails(movieId.toString());
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ApiErrorHandler, List<TrailerModel>>> getMovieTrailers(
    int movieId,
  ) async {
    try {
      final response = await _apiService.getMovieTrailers(movieId.toString());
      return Right(response.results ?? []);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ApiErrorHandler, List<MoviesModel>>> getUpcomingMovies(
    int page,
  ) async {
    try {
      final response = await _apiService.getUpcomingMovies({
        ApiParams.page: page,
      });
      return Right(response.results ?? []);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ApiErrorHandler, List<MoviesModel>>> getPopularMovies(
    int page,
    String genreId,
  ) async {
    try {
      final response = await _apiService.getMovies({
        ApiParams.page: page,
        ApiParams.sortBy: 'popularity.desc',
        ApiParams.language: 'en-US',
        ApiParams.includeVideo: true,
        ApiParams.includeAdult: false,
        if (genreId.isNotEmpty) ApiParams.withGenres: genreId,
      });
      return Right(response.results ?? []);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ApiErrorHandler, List<MoviesModel>>> getRecommendations(
    String id,
  ) async {
    try {
      final response = await _apiService.getMoviesRecommendations(id, {
        ApiParams.language: 'en-US',
        ApiParams.page: '1',
      });
      return Right(response.results ?? []);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ApiErrorHandler, List<MoviesModel>>> searchMovies(
    String query,
  ) async {
    try {
      final response = await _apiService.searchMovies({
        ApiParams.query: query,
        ApiParams.language: 'en-US',
        ApiParams.page: '1',
        ApiParams.includeAdult: false,
      });
      return Right(response.results ?? []);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
