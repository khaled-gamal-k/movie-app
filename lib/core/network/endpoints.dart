abstract class Endpoints {
  // Movies Endpoints
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String movieDetails = 'movie/{${ApiParams.movieId}}';
  static const String discoverMovies = 'discover/movie';
  static const String topRatedMovies = 'movie/top_rated';
  static const String nowPlayingMovies = 'movie/now_playing';
  static const String upcomingMovies = 'movie/upcoming';
  static const String searchMovies = 'search/movie';
  static const String moviesRecommendations =
      'movie/{${ApiParams.movieId}}/recommendations';

  static const String movieTrailers = 'movie/{${ApiParams.movieId}}/videos';

  // Tv Shows Endpoints
  static const String tvShowDetails = 'tv';
  static const String discoverTvShows = 'discover/tv';
  static const String topRatedTvShows = 'tv/top_rated';
  static const String airingTodayTvShows = 'tv/airing_today';
  static const String onTheAirTvShows = 'tv/on_the_air';
  static const String searchTvShows = 'search/tv';
  static const String tvShowRecommendations = 'tv/{tv_show_id}/recommendations';
}

abstract class ApiParams {
  static const String apiKey = 'api_key';
  static const String query = 'query';
  static const String page = 'page';
  static const String movieId = 'movie_id';
  static const String sortBy = 'sort_by';
  static const String language = 'language';
  static const String includeAdult = 'include_adult';
  static const String includeVideo = 'include_video';
  static const String includeImageLanguage = 'include_image_language';
  static const String region = 'region';
  static const String withGenres = 'with_genres';
}
