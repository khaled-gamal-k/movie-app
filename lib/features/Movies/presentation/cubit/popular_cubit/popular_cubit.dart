import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repos/movie_repo.dart';
import 'popular_state.dart';

class PopularMoviesCubit extends Cubit<PopularState> {
  PopularMoviesCubit(this.movieRepo) : super(const PopularState.initial());

  final MovieRepo movieRepo;

  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;
  List movies = [];

  void getPopularMovies({bool loadMore = false, String category = ''}) async {
    if (_isLoadingMore) return;

    if (!loadMore) {
      emit(const PopularState.loading());
      _currentPage = 1;
      movies.clear();
    } else {
      _isLoadingMore = true;
      _currentPage++;
    }

    final result = await movieRepo.getPopularMovies(_currentPage, category);
    result.fold(
      (l) {
        emit(PopularState.error(l.message));
        _isLoadingMore = false;
      },
      (r) {
        movies.addAll(r);
        emit(PopularState.popularMovies(List.from(movies)));
        _isLoadingMore = false;
      },
    );
  }
}
