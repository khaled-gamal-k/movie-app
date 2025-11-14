import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/features/Movies/data/models/movies_model.dart';

part 'recommendations_state.freezed.dart';

@freezed
class RecommendationsState with _$RecommendationsState {
  const factory RecommendationsState.initial() = _Initial;
  const factory RecommendationsState.loading() = _Loading;
  const factory RecommendationsState.loaded(List<MoviesModel> movies) = _Loaded;
  const factory RecommendationsState.error(String message) = _Error;
}
