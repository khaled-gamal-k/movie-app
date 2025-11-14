import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../cubit/movie_cubit/movie_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme/app_colors.dart';
import '../cubit/movie_cubit/movie_state.dart';
import 'upcoming_movies_item_shimmer.dart';
import 'upcoming_movies_item.dart';

class CarouselUpcomingMovies extends StatefulWidget {
  const CarouselUpcomingMovies({super.key});

  @override
  State<CarouselUpcomingMovies> createState() => _CarouselUpcomingMoviesState();
}

class _CarouselUpcomingMoviesState extends State<CarouselUpcomingMovies> {
  final _carouselController = CarouselSliderController();
  int _activeIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => Container(),
        loading: () => CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: 5,
          itemBuilder: (context, index, realIndex) =>
              const UpcomingMoviesItemShimmer().paddingSym(v: 20),
          options: CarouselOptions(
            aspectRatio: 1.8,
            autoPlay: true,
            reverse: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) => _onPageChanged(index),
          ),
        ),
        getUpcomingMovies: (movies) => Column(
          children: [
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: movies.length,
              itemBuilder: (context, index, realIndex) =>
                  UpcomingMoviesItem(movie: movies[index]).paddingSym(v: 20),
              options: CarouselOptions(
                aspectRatio: 1.8,
                autoPlay: true,
                reverse: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) => _onPageChanged(index),
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: _activeIndex % 5,
              count: 5,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: AppColors.blueAccent,
                dotColor: AppColors.blueAccent.withValues(alpha: 0.4),
              ),
              onDotClicked: (index) => _carouselController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
            ),
          ],
        ),
        error: (message) => Center(child: Text(message)),
      ),
    );
  }
}
