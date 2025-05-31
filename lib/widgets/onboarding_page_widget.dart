import 'package:flutter/material.dart';

class OnboardingPageContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPageContent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
      ],
    );
  }
}
