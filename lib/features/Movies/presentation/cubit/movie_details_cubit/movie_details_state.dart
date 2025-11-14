import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/movie_details_model/movie_details_model.dart';
import '../../../data/models/trailer_model.dart';


part 'movie_details_state.freezed.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _Initial;
  const factory MovieDetailsState.loading() = _Loading;
  const factory MovieDetailsState.movieDetails(
    MovieDetailsModel movieDetails,
    TrailerModel? trailer,
  ) = _MovieDetails;
  const factory MovieDetailsState.error(String message) = _Error;
}
