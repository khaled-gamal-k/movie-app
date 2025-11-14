abstract class Helper {
  static const Map<int, String> _genresMap = {
    // Movie genres
    28: 'Action',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    27: 'Horror',
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Science Fiction',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western',

    // TV genres
    10759: 'Action & Adventure',
    10762: 'Kids',
    10763: 'News',
    10764: 'Reality',
    10765: 'Sci-Fi & Fantasy',
    10766: 'Soap',
    10767: 'Talk',
    10768: 'War & Politics',
  };

  static const List<Map<String, String>> genres = [
    {'id': '', 'name': 'All'},
    {'id': '28', 'name': 'Action'},
    {'id': '12', 'name': 'Adventure'},
    {'id': '16', 'name': 'Animation'},
    {'id': '35', 'name': 'Comedy'},
    {'id': '80', 'name': 'Crime'},
    {'id': '99', 'name': 'Documentary'},
    {'id': '18', 'name': 'Drama'},
    {'id': '10751', 'name': 'Family'},
    {'id': '14', 'name': 'Fantasy'},
    {'id': '36', 'name': 'History'},
    {'id': '27', 'name': 'Horror'},
    {'id': '10402', 'name': 'Music'},
    {'id': '9648', 'name': 'Mystery'},
    {'id': '10749', 'name': 'Romance'},
    {'id': '878', 'name': 'Science Fiction'},
    {'id': '10770', 'name': 'TV Movie'},
    {'id': '53', 'name': 'Thriller'},
    {'id': '10752', 'name': 'War'},
    {'id': '37', 'name': 'Western'},
  ];
  
  static const String _posterImageBaseUrl =
      'https://image.tmdb.org/t/p/original';
  static const String _smallPosterImageBaseUrl =
      'https://image.tmdb.org/t/p/w185';
  static const String _mediumPosterImageBaseUrl =
      'https://image.tmdb.org/t/p/w200';
  static const String _backdropImageBaseUrl =
      'https://image.tmdb.org/t/p/w1280';

  static List<String> getGenres(List<int> genreIds) {
    return genreIds
        .map((id) => _genresMap[id] ?? 'Unknown')
        .where((name) => name != 'Unknown')
        .toList();
  }

  static String getPosterImage(String posterPath) =>
      _posterImageBaseUrl + posterPath;

  static String getSmallPosterImage(String posterPath) =>
      _smallPosterImageBaseUrl + posterPath;

  static String getMediumPosterImage(String posterPath) =>
      _mediumPosterImageBaseUrl + posterPath;

  static String getBackdropImage(String posterPath) =>
      _backdropImageBaseUrl + posterPath;
}
