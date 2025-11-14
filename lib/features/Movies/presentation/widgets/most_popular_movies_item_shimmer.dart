import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MostPopularMoviesItemShimmer extends StatelessWidget {
  const MostPopularMoviesItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔳 Poster placeholder
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: SizedBox(
              height: 250, // match your poster aspect
              width: double.infinity,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[700]!,
                period: const Duration(milliseconds: 1400),
                child: Container(color: Colors.grey[800]),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 🔳 Title placeholder
          Container(
            height: 14,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[700]!,
              period: const Duration(milliseconds: 1400),
              child: Container(color: Colors.grey[800]),
            ),
          ),

          const SizedBox(height: 8),

          // 🔳 Genre + year row placeholder
          Container(
            height: 12,
            width: 120,
            margin: const EdgeInsets.only(left: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[700]!,
              period: const Duration(milliseconds: 1400),
              child: Container(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
