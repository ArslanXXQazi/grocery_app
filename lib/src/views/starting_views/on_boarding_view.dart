import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Get for navigation
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Smooth page indicator
import 'package:grocery_app/src/controller/constant/linker.dart';// Smooth page indicator
import 'package:grocery_app/src/controller/constant/linker.dart'; // Assuming AppImages and AppRoutes are here
import 'package:grocery_app/src/controller/components/black_text.dart'; // Your custom text widget

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final List<Map<String, String>> onboardingPages = [
    {
      "image": AppImages.onboarding1,
      "title": "Buy Grocery",
      "description": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
    },
    {
      "image": AppImages.onboarding2,
      "title": "Fast Delivery",
      "description": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
    },
    {
      "image": AppImages.onboarding3,
      "title": "Enjoy Quality Food",
      "description": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingPages.length,
            itemBuilder: (context, index) {
              return buildOnboardingPage(
                image: onboardingPages[index]["image"]!,
                title: onboardingPages[index]["title"]!,
                description: onboardingPages[index]["description"]!,
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip Button
                BlackNormalText(
                  text: "Skip",
                  onTap: () {
                    Get.offAllNamed(AppRoutes.signInView); // Go to sign in view
                  },
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.grey,
                ),
                // Indicator and Next Button
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingPages.length,
                  effect: WormEffect(
                    activeDotColor: Colors.green,
                    dotColor: Colors.grey.shade300,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 4,
                  ),
                ),
                // Next Button
                GestureDetector(
                  onTap: () {
                    if (_pageController.page!.toInt() == onboardingPages.length - 1) {
                      Get.offAllNamed(AppRoutes.signInView); // Go to sign in view on last page
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: BlackNormalText(
                      text: "Next",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 350, // Adjust height as needed
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          BlackNormalText(
            text: title,
            fontSize: 25,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          BlackNormalText(
            text: description,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            textColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
