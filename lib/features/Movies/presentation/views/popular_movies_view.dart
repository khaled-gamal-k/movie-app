import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/shared/widgets/search_bar.dart';
import 'package:movies/features/Movies/presentation/cubit/popular_cubit/popular_cubit.dart';
import 'package:movies/features/Movies/presentation/cubit/popular_cubit/popular_state.dart';
import '../../../../core/theme/app_text_style.dart';
import '../widgets/popular_movie_item.dart';
import '../widgets/popular_movie_shimmer_item.dart';

class PopularMoviesView extends StatefulWidget {
  const PopularMoviesView({super.key});

  @override
  State<PopularMoviesView> createState() => _PopularMoviesViewState();
}

class _PopularMoviesViewState extends State<PopularMoviesView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<PopularMoviesCubit>();
    cubit.getPopularMovies();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        cubit.getPopularMovies(loadMore: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popular Movies',
          style: AppTextStyles.semiBold18White(context),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PopularMoviesCubit, PopularState>(
        builder: (context, state) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverToBoxAdapter(child: CustomSearchBar()),
              state.maybeWhen(
                orElse: () => Container(),
                loading: () => SliverList.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) =>
                      const PopularMovieShimmerItem(),
                ),
                popularMovies: (popularMovies) {
                  if (popularMovies.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(child: Text('No movies found')),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final isLastItem = index == popularMovies.length;
                      final isLoadingMore = context
                          .read<PopularMoviesCubit>()
                          .isLoadingMore;

                      if (isLastItem) {
                        return isLoadingMore
                            ? const PopularMovieShimmerItem()
                            : const SizedBox();
                      }

                      final movie = popularMovies[index];
                      return PopularMovieItem(movie: movie);
                    }, childCount: popularMovies.length + 1),
                  );
                },
                error: (message) => SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      message,
                      style: AppTextStyles.medium14Grey(context),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
