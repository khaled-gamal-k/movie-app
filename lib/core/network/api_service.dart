import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/Movies/data/models/movie_details_model/movie_details_model.dart';
import '../../features/Movies/data/models/movies_model.dart';
import '../../features/Movies/data/models/trailer_model.dart';
import 'base_response.dart';
import 'endpoints.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(Endpoints.discoverMovies)
  Future<BaseResponse<List<MoviesModel>>> getMovies(
    @Queries() Map<String, dynamic> queries,
  );
  @GET(Endpoints.upcomingMovies)
  Future<BaseResponse<List<MoviesModel>>> getUpcomingMovies(
    @Queries() Map<String, dynamic> queries,
  );

  @GET(Endpoints.movieDetails)
  Future<MovieDetailsModel> getMovieDetails(
    @Path(ApiParams.movieId) String id, {
    @Query(ApiParams.language) String language = 'en-US',
  });

  @GET(Endpoints.movieTrailers)
  Future<BaseResponse<List<TrailerModel>>> getMovieTrailers(
    @Path(ApiParams.movieId) String id, {
    @Query(ApiParams.language) String language = 'en-US',
  });

  @GET(Endpoints.searchMovies)
  Future<BaseResponse<List<MoviesModel>>> searchMovies(
    @Queries() Map<String, dynamic> queries,
  );

  @GET(Endpoints.moviesRecommendations)
  Future<BaseResponse<List<MoviesModel>>> getMoviesRecommendations(
    @Path(ApiParams.movieId) String id,
    @Queries() Map<String, dynamic> queries,
  );
}
