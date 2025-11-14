import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/Movies/domain/repos/movie_repo.dart';

import 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  RecommendationsCubit(this._movieRepo)
    : super(const RecommendationsState.initial());
  final MovieRepo _movieRepo;

  void getRecommendations(int id) async {
    emit(const RecommendationsState.loading());
    final result = await _movieRepo.getRecommendations(id.toString());
    result.fold(
      (l) => emit(RecommendationsState.error(l.message)),
      (r) => emit(RecommendationsState.loaded(r)),
    );
  }
}
