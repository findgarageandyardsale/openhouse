import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:open_house/routes/app_route.gr.dart';

import '../../../../shared/theme/app_colors.dart';

@RoutePage()
class CustomIntroScreen extends StatefulWidget {
  const CustomIntroScreen({super.key});

  @override
  State<CustomIntroScreen> createState() => _CustomIntroScreenState();
}

class _CustomIntroScreenState extends State<CustomIntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _svgImages = [
    'assets/1.jpeg',
    'assets/2.jpeg',
    'assets/3.jpeg',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPage() {
    if (_currentPage < _svgImages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _onDone();
    }
  }

  void _onDone() {
    AutoRouter.of(
      context,
    ).pushAndPopUntil(const DashboardScreen(), predicate: (_) => false);
  }

  void _onSkip() {
    _onDone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _svgImages.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(_svgImages[index], fit: BoxFit.cover),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _onSkip,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        _svgImages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color:
                                _currentPage == index
                                    ? AppColors.primary
                                    : AppColors.secondaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _onNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 4,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      _currentPage == _svgImages.length - 1 ? 'Start' : 'Next',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
