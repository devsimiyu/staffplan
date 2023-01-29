import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:staffplan/screens/screens_barrel.dart' show LoginScreen;
import 'package:staffplan/utils/utils_barrel.dart'
    show StaffPlanTheme, OnboardingStrings;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: buildPages(context),
            ),
            buildIndicator(),
            SizedBox(
              height: size.height * 0.035,
            ),
            buildActionButtons(),
            SizedBox(
              height: size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPages(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        onboardingPageView(
          const AssetImage(
            OnboardingStrings.stockImg,
          ),
          OnboardingStrings.stock,
          OnboardingStrings.stockDesc,
          context,
        ),
        onboardingPageView(
          const AssetImage(
            OnboardingStrings.notesImg,
          ),
          OnboardingStrings.notes,
          OnboardingStrings.notesDesc,
          context,
        ),
        onboardingPageView(
          const AssetImage(
            OnboardingStrings.organizeImg,
          ),
          OnboardingStrings.organize,
          OnboardingStrings.organizeDesc,
          context,
        ),
        onboardingPageView(
          const AssetImage(
            OnboardingStrings.captureImg,
          ),
          OnboardingStrings.capture,
          OnboardingStrings.captureDesc,
          context,
        ),
      ],
    );
  }

  Widget onboardingPageView(ImageProvider imageProvider, String text,
      String description, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Text(
            text,
            style: StaffPlanTheme.lightTextTheme.headline2,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * 0.020,
          ),
          Text(
            description,
            style: StaffPlanTheme.lightTextTheme.headline5,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
        ],
      ),
    );
  }

  // , String? description
  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 4,
      effect: const ExpandingDotsEffect(
        activeDotColor: StaffPlanTheme.mainColor,
        dotColor: StaffPlanTheme.faintMainColor,
        dotHeight: 8,
        dotWidth: 15,
      ),
    );
  }

  Widget buildActionButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            minimumSize: const Size(
              80,
              10,
            ),
          ),
          onPressed: () {
            if (controller.page == 3.0) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            } else {
              controller.nextPage(
                duration: const Duration(
                  seconds: 1,
                ),
                curve: Curves.ease,
              );
            }
          },
          child: const Text(
            OnboardingStrings.next,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            minimumSize: const Size(
              80,
              10,
            ),
            backgroundColor: Colors.white,
            foregroundColor: StaffPlanTheme.mainColor,
          ),
          child: const Text(
            OnboardingStrings.skip,
          ),
        ),
      ],
    );
  }
}
