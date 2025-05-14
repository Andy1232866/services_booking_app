import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final PageController controller;

  const OnboardingPageContent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            imagePath,
            width: 300,
            height: 300,
          ),
        ),
        const SizedBox(height: 60.0),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: const WormEffect(
            activeDotColor: Color(0xFFFEA800),
            dotHeight: 7,
            dotWidth: 7,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
          style: ElevatedButton.styleFrom(
            elevation: 1.0,
            backgroundColor: const Color(0xFFFEA800),
            minimumSize: const Size(300, 50),
          ),
          child: const Text(
            'Create Account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            minimumSize: const Size(300, 50),
          ),
          child: const Text(
            'Already Have an Account',
            style: TextStyle(
              color: Color(0xFFFEA800),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
