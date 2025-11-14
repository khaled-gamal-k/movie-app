import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../core/routers/routers_constants.dart';
import '../../../core/services/prefs_service.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Discover Endless Movies',
      subtitle:
          'Dive into a world of films — from timeless classics to the latest blockbusters.',
      image: AppImages.firstOnboard,
    ),
    OnboardingData(
      title: 'Explore Top TV Series',
      subtitle:
          'Find trending shows and explore stories loved by millions of viewers.',
      image: AppImages.secondOnboard,
    ),
    OnboardingData(
      title: 'Stay Updated Instantly',
      subtitle:
          'Get the newest releases and popular titles, updated every day.',
      image: AppImages.thirdOnboard,
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onComplete(int index) async {
    if (index == _pages.length - 1) {
      await PrefsService.setData(AppConstants.isFirstTime, false);
      // ignore: use_build_context_synchronously
      if (context.mounted) context.go(Routers.home);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) =>
                OnboardingPage(data: _pages[index]),
          ),

          // Indicators + Button Row
          _buildIndicatorsRow(),
        ],
      ),
    );
  }

  Widget _buildIndicatorsRow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmoothPageIndicator(
            controller: _pageController,
            count: _pages.length,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: AppColors.blueAccent,
              dotColor: AppColors.blueAccent.withValues(alpha: 0.4),
            ),
          ),
          const Spacer(),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.blueAccent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IconButton(
        onPressed: () {
          if (_currentPage < _pages.length - 1) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          } else {
            _onComplete(_currentPage);
          }
        },
        icon: Icon(
          _currentPage == _pages.length - 1
              ? Icons.check
              : Icons.arrow_forward_ios,
          color: AppColors.black,
        ),
      ),
    );
  }
}
