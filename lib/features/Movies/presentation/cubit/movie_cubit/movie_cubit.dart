import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repos/movie_repo.dart';

import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.movieRepo) : super(const MovieState.initial());
  final MovieRepo movieRepo;
  void getUpcomingMovies(int page) async {
    emit(const MovieState.loading());
    final result = await movieRepo.getUpcomingMovies(page);
    result.fold(
      (l) => emit(MovieState.error(l.message)),
      (r) => emit(MovieState.getUpcomingMovies(r)),
    );
  }
}
