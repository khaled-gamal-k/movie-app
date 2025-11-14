import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/shared/widgets/blur_rating.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/helper.dart';
import '../../data/models/movies_model.dart';

import '../../../../core/routers/routers_constants.dart';
import '../../../../core/theme/app_text_style.dart';

class MostPopularMoviesItem extends StatelessWidget {
  const MostPopularMoviesItem({super.key, required this.movie});
  final MoviesModel movie;

  @override
  Widget build(BuildContext context) {
    final year = movie.releaseDate?.split('-').first ?? "N/A";
    final genres = Helper.getGenres(movie.genreIds ?? []);
    final gen = genres.firstOrNull ?? 'Unknown';

    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.soft,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: Helper.getSmallPosterImage(movie.posterPath ?? ''),
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),

              // ⭐ Rating tag with blur background
              BlurRating(voteAverage: movie.voteAverage),
            ],
          ),
          10.height,
          Text(
            movie.title ?? 'Unknown',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.semiBold14White(context),
          ).paddingLeft(10),
          5.height,
          Text(
            "$gen | $year",
            style: AppTextStyles.medium10Grey(context),
          ).paddingLeft(10),
        ],
      ),
    ).onPressed(() => context.push('${Routers.movieDetails}/${movie.id}'));
  }
}
