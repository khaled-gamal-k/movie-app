import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/services/get_it_service.dart';
import 'package:movies/features/Movies/presentation/cubit/cubit/recommendations_cubit.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/routers/routers_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/movie_details_model/movie_details_model.dart';
import '../../data/models/trailer_model.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/helper.dart';
import '../cubit/cubit/recommendations_state.dart';
import '../cubit/movie_details_cubit/movie_details_cubit.dart';
import '../cubit/movie_details_cubit/movie_details_state.dart';
import '../widgets/most_popular_movies_item.dart';
import '../widgets/most_popular_movies_item_shimmer.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movieID});
  final String movieID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => Container(),
          movieDetails: (movieDetails, trailer) => SingleChildScrollView(
            child: Column(
              children: [
                _buildBackdrop(context, movieDetails, trailer),
                _buildDetails(context, movieDetails),
              ],
            ),
          ),
          error: (message) => Center(child: Text(message)),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildBackdrop(
    BuildContext context,
    MovieDetailsModel movie,
    TrailerModel? trailer,
  ) {
    final genre = movie.genres?.firstOrNull?.name ?? "Unknown";
    final runtime = movie.runtime ?? 0;
    final year = movie.releaseDate?.split('-').first ?? "N/A";
    return SizedBox(
      height: context.height * 0.65,
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  Helper.getBackdropImage(movie.backdropPath ?? ''),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.dark.withValues(alpha: 0.1),
                  AppColors.dark.withValues(alpha: 0.9),
                  AppColors.dark,
                ],
                stops: const [0.2, 0.7, 1.0],
              ),
            ),
          ),

          // Top Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(
                    onTap: () => Navigator.pop(context),
                    icon: Icons.arrow_back_ios_new_rounded,
                  ),
                  const Spacer(),
                  _circleButton(onTap: () {}, icon: Icons.favorite_border),
                ],
              ),
            ),
          ),

          // Center Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Poster
                Hero(
                  tag: 'movie_poster',
                  child: CachedNetworkImage(
                    imageUrl: Helper.getMediumPosterImage(
                      movie.posterPath ?? '',
                    ),
                  ),
                ),
                18.height,

                // Title
                Text(
                  movie.title ?? 'No Title',
                  style: AppTextStyles.semiBold18White(context),
                  textAlign: TextAlign.center,
                ),
                8.height,

                // Genres + Runtime + Year
                Text(
                  '$genre • $runtime min • $year',
                  style: AppTextStyles.medium12Grey(context),
                  textAlign: TextAlign.center,
                ),
                8.height,

                // Rated
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColors.soft,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: 'Rated: ',

                      style: AppTextStyles.semiBold14White(context),
                      children: [
                        TextSpan(
                          text: movie.adult == false ? 'PG-13' : '18+',
                          style: movie.adult == true
                              ? AppTextStyles.semiBold14Red(context)
                              : AppTextStyles.semiBold14Accent(context),
                        ),
                      ],
                    ),
                  ),
                ),

                if (trailer != null) ...[
                  10.height,
                  _buildTrailerButton(
                    context,
                    movieID: trailer.key ?? '',
                    movieName: movie.title ?? '',
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton({required VoidCallback onTap, required IconData icon}) {
    return Container(
      height: 36,
      width: 36,
      decoration: const BoxDecoration(
        color: Colors.black45,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  Widget _buildDetails(BuildContext context, MovieDetailsModel movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsCard(
            context,
            voteAverage: movie.voteAverage ?? 0.0,
            voteCount: movie.voteCount ?? 0,
            revenue: movie.revenue ?? 0,
            budget: movie.budget ?? 0,
          ),
          25.height,

          // Overview
          Text('Overview', style: AppTextStyles.semiBold16White(context)),
          10.height,
          Text(
            movie.overview ?? '',
            style: AppTextStyles.regular14WhiteGrey(context),
          ),
          25.height,

          // Production Company
          Text(
            'Production Company',
            style: AppTextStyles.semiBold16White(context),
          ),
          12.height,
          _buildProductionCompany(context, movie),
          25.height,

          // Most Popular Movies
          _buildRecommendationsMoviesList(movie.id ?? 0),
        ],
      ),
    );
  }

  Widget _buildRecommendationsMoviesList(int id) {
    return BlocProvider(
      create: (context) =>
          getIt<RecommendationsCubit>()..getRecommendations(id),
      child: BlocBuilder<RecommendationsCubit, RecommendationsState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => Container(),
          loading: () => SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (_, __) =>
                  const MostPopularMoviesItemShimmer().paddingRight(20),
            ),
          ),
          loaded: (movies) {
            if (movies.isEmpty) {
              return const SizedBox.shrink();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(color: AppColors.darkGrey),
                10.height,
                Text(
                  'Recommendations Movies',
                  style: AppTextStyles.semiBold16White(context),
                ),
                20.height,
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (_, index) => MostPopularMoviesItem(
                      movie: movies[index],
                    ).paddingRight(20),
                  ),
                ),
              ],
            );
          },
          error: (message) => Center(child: Text(message)),
        ),
      ),
    );
  }

  Widget _buildStatsCard(
    BuildContext context, {
    required double voteAverage,
    required int voteCount,
    required int revenue,
    required int budget,
  }) {
    String formatMoney(int amount) {
      //
      if (amount >= 1000000) {
        return '${(amount / 1000000).toStringAsFixed(1)}M';
      } else if (amount >= 1000) {
        return '${(amount / 1000).toStringAsFixed(1)}K';
      }
      return amount.toString();
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.soft.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem(
            context,
            icon: Icons.star,
            label: 'Rating',
            value: '$voteAverage',
            color: AppColors.orange,
          ),
          _buildStatItem(
            context,
            icon: Icons.people,
            label: 'Votes',
            value: '$voteCount',
            color: AppColors.blueAccent,
          ),
          _buildStatItem(
            context,
            icon: Icons.attach_money,
            label: 'Revenue',
            value: formatMoney(revenue),
            color: Colors.greenAccent,
          ),
          _buildStatItem(
            context,
            icon: Icons.money_off,
            label: 'Budget',
            value: formatMoney(budget),
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20.sp),
        5.height,
        Text(value, style: AppTextStyles.semiBold14White(context)),
        Text(label, style: AppTextStyles.medium12Grey(context)),
      ],
    );
  }

  Widget _buildProductionCompany(
    BuildContext context,
    MovieDetailsModel movie,
  ) {
    final company = movie.productionCompanies?.firstOrNull;
    final country = movie.productionCountries?.firstOrNull;

    final companyLogo = Helper.getSmallPosterImage(company?.logoPath ?? '');
    final companyName = company?.name ?? 'Unknown Company';
    final countryName = country?.name ?? 'Unknown Country';

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.soft.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: CachedNetworkImage(
          imageUrl: companyLogo,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.contain,
          color: AppColors.white,
        ),
      ),
      title: Text(companyName, style: AppTextStyles.semiBold14White(context)),
      subtitle: Text(
        countryName,
        style: AppTextStyles.regular12WhiteGrey(context),
      ),
    );
  }

  Widget _buildTrailerButton(
    BuildContext context, {
    required String movieID,
    required String movieName,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(180, 50),
      ),
      onPressed: () =>
          context.push('${Routers.trailer}/$movieID', extra: movieName),
      label: Text('Watch Trailer', style: AppTextStyles.medium16White(context)),
      icon: const Icon(Icons.play_arrow, size: 30),
    );
  }
}
