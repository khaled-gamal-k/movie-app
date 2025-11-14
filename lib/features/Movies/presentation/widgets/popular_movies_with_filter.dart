import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/utils/helper.dart';

import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/routers/routers_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../cubit/popular_cubit/popular_cubit.dart';
import '../cubit/popular_cubit/popular_state.dart';
import 'most_popular_movies_item.dart';
import 'most_popular_movies_item_shimmer.dart';

class PopularMoviesWithFilter extends StatefulWidget {
  const PopularMoviesWithFilter({super.key});

  @override
  State<PopularMoviesWithFilter> createState() =>
      _PopularMoviesWithFilterState();
}

class _PopularMoviesWithFilterState extends State<PopularMoviesWithFilter> {
  ValueNotifier<int> selectedCategoryNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedCategoryNotifier,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories', style: AppTextStyles.semiBold16White(context)),
            15.height,

            // Categories List
            _buildCategoriesList(),
            30.height,

            // Most Popular Movies
            Row(
              children: [
                Text(
                  'Most Popular',
                  style: AppTextStyles.semiBold16White(context),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => context.push(Routers.popular),
                  child: Text(
                    'See All',
                    style: AppTextStyles.medium14Accent(context),
                  ),
                ),
              ],
            ).paddingRight(15),
            15.height,
            _buildMostPopularMoviesList(),
          ],
        );
      },
    ).paddingLeft(20).paddingTop(20).paddingBottom(20);
  }

  Widget _buildMostPopularMoviesList() {
    return BlocBuilder<PopularMoviesCubit, PopularState>(
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
        popularMovies: (movies) {
          if (movies.isEmpty) {
            return const Center(child: Text('No movies found'));
          }
          return SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (_, index) =>
                  MostPopularMoviesItem(movie: movies[index]).paddingRight(20),
            ),
          );
        },
        error: (message) => Center(child: Text(message)),
      ),
    );
  }

  Widget _buildCategoriesList() {
    final genres = Helper.genres;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            _buildCategoryItem(genres[index], index),
        itemCount: genres.length,
      ),
    );
  }

  Widget _buildCategoryItem(Map<String, dynamic> category, int index) {
    final isSelected = selectedCategoryNotifier.value == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.soft : AppColors.dark,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        category['name'],
        style: AppTextStyles.medium12WhiteGrey(context).copyWith(
          color: isSelected ? AppColors.blueAccent : AppColors.whiteGrey,
        ),
      ),
    ).onPressed(() {
      selectedCategoryNotifier.value = index;
      context.read<PopularMoviesCubit>().getPopularMovies(category: category['id']);
    });
  }
}
