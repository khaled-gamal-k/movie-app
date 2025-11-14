import 'package:dartz/dartz.dart';
import '../../data/models/movie_details_model/movie_details_model.dart';
import '../../data/models/trailer_model.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../data/models/movies_model.dart';

abstract class MovieRepo {
  Future<Either<ApiErrorHandler, List<MoviesModel>>> getUpcomingMovies(
    int page,
  );
  Future<Either<ApiErrorHandler, List<MoviesModel>>> getPopularMovies(
    int page,
    String genreId,
  );
  Future<Either<ApiErrorHandler, MovieDetailsModel>> getMovieDetails(
    int movieId,
  );
  Future<Either<ApiErrorHandler, List<TrailerModel>>> getMovieTrailers(
    int movieId,
  );

  Future<Either<ApiErrorHandler, List<MoviesModel>>> getRecommendations(
    String id,
  );

  Future<Either<ApiErrorHandler, List<MoviesModel>>> searchMovies(String query);
}
