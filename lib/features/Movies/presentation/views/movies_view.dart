import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/shared/widgets/search_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/app_constants.dart';

import '../widgets/carousel_upcoming_movies.dart';
import '../widgets/popular_movies_with_filter.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: SvgPicture.asset(AppImages.logo).paddingLeft(15),
            leadingWidth: 50,
            elevation: 0,
            pinned: true,
            backgroundColor: AppColors.dark,
            centerTitle: true,
            title: Text(
              'CINEMAX',
              style: AppTextStyles.semiBold18White(context),
            ),
          ),

          // Search Bar
          const SliverToBoxAdapter(child: CustomSearchBar()),

          // Carousel Upcoming Movies Section
          const SliverToBoxAdapter(child: CarouselUpcomingMovies()),

          // Popular Movies Section
          const SliverToBoxAdapter(child: PopularMoviesWithFilter()),
        ],
      ),
    );
  }
}
