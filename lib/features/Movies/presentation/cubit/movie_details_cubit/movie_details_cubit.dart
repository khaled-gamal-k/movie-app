import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repos/movie_repo.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.movieRepo) : super(const MovieDetailsState.initial());
  final MovieRepo movieRepo;

  Future<void> getMovieDetails(int id) async {
    emit(const MovieDetailsState.loading());

    // Get movie details first
    final movieResult = await movieRepo.getMovieDetails(id);

    movieResult.fold(
      (failure) => emit(MovieDetailsState.error(failure.message)),
      (movieDetails) async {
        // If movie details succeed, get trailers
        final trailersResult = await movieRepo.getMovieTrailers(id);

        trailersResult.fold(
          (failure) => emit(MovieDetailsState.error(failure.message)),
          (trailers) {
            if (trailers.isEmpty) {
              emit(MovieDetailsState.movieDetails(movieDetails, null));
            }
            final trailer = trailers.firstWhere(
              (element) =>
                  element.type == 'Trailer' &&
                  element.site == 'YouTube' &&
                  element.official == true,
            );
            emit(MovieDetailsState.movieDetails(movieDetails, trailer));
          },
        );
      },
    );
  }
}
