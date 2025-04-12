import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:open_house/routes/app_route.gr.dart';
import 'package:open_house/shared/widgets/action_button.dart';
import '../../../../shared/theme/app_colors.dart';

@RoutePage()
class PreviousCustomIntroScreen extends StatefulWidget {
  const PreviousCustomIntroScreen({super.key});

  @override
  State<PreviousCustomIntroScreen> createState() => _PreviousCustomIntroScreenState();
}

class _PreviousCustomIntroScreenState extends State<PreviousCustomIntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of onboarding data (image, title)
  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/intro1.png',
      'title': 'View properties near you for sale or rent.',
    },
    {
      'image': 'assets/intro2.png',
      'title': 'Upload and showcase your properties.',
    },
    {
      'image': 'assets/intro3.png',
      'title': 'Get directions to open houses instantly.',
    },
  ];

  void onDonePress() {
    AutoRouter.of(
      context,
    ).pushAndPopUntil(const DashboardScreen(), predicate: (_) => false);
  }

  Widget renderSkipBtn() {
    return Text(
      'Skip',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button at the top right
            if (_currentPage != onboardingData.length - 1)
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _currentPage = onboardingData.length - 1;
                    });
                    _pageController.jumpToPage(onboardingData.length - 1);
                  },
                  child: renderSkipBtn(),
                ),
              ),
            // PageView for the carousel
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image
                      Image.asset(
                        onboardingData[index]['image']!,
                        height: 300, // Adjust based on your image size
                      ),
                      SizedBox(height: 20),
                      // Title
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            onboardingData[index]['title']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => buildDot(index, context),
              ),
            ),
            SizedBox(height: 20),
            // Buttons (Next, Get Started, Log in)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child:
                  _currentPage == onboardingData.length - 1
                      ? ActionButton(
                        width: double.infinity,
                        onPressed: () {
                          onDonePress();
                          // context.router.replaceAll([LoginScreen()]);
                        },
                        label: 'Get Started',
                      )
                      : ActionButton(
                        width: double.infinity,

                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        label: 'Next',
                      ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Build pagination dots
  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.red : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
