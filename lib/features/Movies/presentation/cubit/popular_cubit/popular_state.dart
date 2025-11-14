import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/movies_model.dart';

part 'popular_state.freezed.dart';

@freezed
class PopularState with _$PopularState {
  const factory PopularState.initial() = _Initial;
  const factory PopularState.loading() = _Loading;
  const factory PopularState.popularMovies(List<MoviesModel> popularMovies) =
      _PopularMovies;
  const factory PopularState.error(String message) = _Error;
}
