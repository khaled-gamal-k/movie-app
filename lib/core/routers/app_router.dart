import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/Movies/presentation/views/popular_movies_view.dart';
import '../services/get_it_service.dart';

import '../../features/Movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import '../../features/Movies/presentation/cubit/movie_details_cubit/movie_details_cubit.dart';
import '../../features/Movies/presentation/cubit/popular_cubit/popular_cubit.dart';
import '../../features/Movies/presentation/views/movie_details_view.dart';
import '../../features/Movies/presentation/views/movies_view.dart';
import '../../features/Movies/presentation/views/trailer_player_view.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import 'routers_constants.dart';
import 'package:go_router/go_router.dart';
import '../services/prefs_service.dart';
import '../utils/app_constants.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    redirect: (context, state) {
      final isFirstTime =
          PrefsService.getBool(AppConstants.isFirstTime) ?? true;
      // ✅ 1. Not First-time launch → home
      if (!isFirstTime && state.matchedLocation == Routers.onboarding) {
        return Routers.home;
      }
      return null; // no redirect
    },
    routes: [
      GoRoute(
        path: Routers.onboarding,
        builder: (_, _) => const OnboardingView(),
      ),
      GoRoute(
        path: Routers.home,
        builder: (_, __) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt.get<MovieCubit>()..getUpcomingMovies(1),
            ),
            BlocProvider(
              create: (_) =>
                  getIt.get<PopularMoviesCubit>()..getPopularMovies(),
            ),
          ],
          child: const MoviesView(),
        ),
      ),
      GoRoute(
        path: Routers.popular,
        builder: (_, __) => BlocProvider(
          create: (context) => getIt.get<PopularMoviesCubit>(),
          child: const PopularMoviesView(),
        ),
      ),
      GoRoute(
        path: '${Routers.movieDetails}/:movieID',
        builder: (_, state) {
          final id = state.pathParameters['movieID']!;
          return BlocProvider(
            create: (context) =>
                getIt.get<MovieDetailsCubit>()..getMovieDetails(int.parse(id)),
            child: MovieDetailsView(movieID: id),
          );
        },
      ),
      GoRoute(
        path: '${Routers.trailer}/:videoKey',
        builder: (_, state) {
          final videoKey = state.pathParameters['videoKey'];
          final movieTitle = state.extra as String;
          return TrailerPlayerView(
            videoKey: videoKey ?? '',
            movieTitle: movieTitle,
          );
        },
      ),
    ],
  );
}
