import 'package:flutter/material.dart';
import 'package:services_booking_app/widgets/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controlador que indica en qué parte del onboarding estamos
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          OnboardingPageContent( // Página 1
            imagePath: 'lib/assets/animations/onboarding_image_1.gif',
            title: 'We Provide Professional\nService at a Friendly Price',
            description: 'We offer top-notch, professional services tailored to meet your needs, ensuring quality.',
            controller: _controller,
          ),
          OnboardingPageContent( // Página 2
            imagePath: 'lib/assets/animations/onboarding_image_2.gif',
            title: 'The Best Results and Your Satisfaction is Our Top Priority',
            description: 'We are dedicated to delivering the best results with a focus on quality and precision.',
            controller: _controller,
          ),
          OnboardingPageContent( // Página 3
            imagePath: 'lib/assets/animations/onboarding_image_3.gif',
            title: "Let's Make Awesome Changes to Your Home",
            description: "Let's transform your home into something amazing with expert craftsmanship solutions!",
            controller: _controller,
          ),
        ],
      ),
    );
  }
}