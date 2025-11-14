import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/extensions/widgets_extensions.dart';
import 'package:movies/features/Movies/data/models/movies_model.dart';
import '../../../../core/routers/routers_constants.dart';
import '../../../../core/shared/widgets/blur_rating.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/helper.dart';

class PopularMovieItem extends StatelessWidget {
  const PopularMovieItem({super.key, required this.movie});
  final MoviesModel movie;

  @override
  Widget build(BuildContext context) {
    final genres = Helper.getGenres(movie.genreIds ?? []);
    final genre = genres.firstOrNull;
    final year = movie.releaseDate?.split('-').first ?? "N/A";

    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              // Movie poster
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: Helper.getSmallPosterImage(movie.posterPath ?? ''),
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              // ⭐ Rating tag with blur background
              BlurRating(voteAverage: movie.voteAverage),
            ],
          ),

          20.width,

          // 🎬 Movie details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Age rating
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blueAccent, width: 1.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: 'Rated: ',
                      style: AppTextStyles.semiBold12White(context),
                      children: [
                        TextSpan(
                          text: movie.adult == false ? 'PG-13' : '18+',
                          style: movie.adult == true
                              ? AppTextStyles.semiBold12Red(context)
                              : AppTextStyles.semiBold12Accent(context),
                        ),
                      ],
                    ),
                  ),
                ),

                5.height,
                Text(
                  movie.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.semiBold16White(context),
                ),
                5.height,
                _buildMovieStatsRow(
                  context: context,
                  text: year,
                  icon: Icons.date_range,
                ),
                5.height,
                _buildMovieStatsRow(
                  context: context,
                  text: '${movie.voteCount} Votes',
                  icon: Icons.thumb_up,
                ),
                5.height,
                _buildMovieStatsRow(
                  context: context,
                  text: genre ?? 'Unknown',
                  icon: Icons.movie,
                ),
              ],
            ),
          ),
        ],
      ),
    ).onPressed(() => context.push('${Routers.movieDetails}/${movie.id}'));
  }

  Widget _buildMovieStatsRow({
    required BuildContext context,
    required String text,
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColors.grey, size: 16.sp),
        5.width,
        Text(text, style: AppTextStyles.medium12Grey(context)),
      ],
    );
  }
}
