import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/helper.dart';

import '../../../../core/routers/routers_constants.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../data/models/movies_model.dart';

class UpcomingMoviesItem extends StatelessWidget {
  const UpcomingMoviesItem({super.key, required this.movie});
  final MoviesModel movie;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(movie.releaseDate ?? '');
    final foramatedDate = DateFormat.yMMMd().format(date);
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        // Backdrop Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                Helper.getBackdropImage(movie.backdropPath ?? ''),
              ),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) => const Icon(Icons.error),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        // Overlay
        Container(
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        // Title and Date
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              movie.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.semiBold16White(context),
            ),
            3.height,
            Text.rich(
              TextSpan(
                text: 'On ',
                style: AppTextStyles.semiBold12Orange(context),
                children: [
                  TextSpan(
                    text: foramatedDate,
                    style: AppTextStyles.medium12WhiteGrey(context),
                  ),
                ],
              ),
            ),
          ],
        ).paddingLeft(10).paddingBottom(10).paddingRight(50),
      ],
    ).onPressed(() => context.push('${Routers.movieDetails}/${movie.id}', extra: movie));
  }
}
