import 'package:flutter/material.dart';
import 'package:services_booking_app/widgets/onboarding_page_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: const [
                OnboardingPageContent(
                  imagePath: 'lib/assets/animations/onboarding_image_1.gif',
                  title: 'We Provide Professional\nService at a Friendly Price',
                  description:
                      'We offer top-notch, professional services\ntailored to meet your needs, ensuring quality.',
                ),
                OnboardingPageContent(
                  imagePath: 'lib/assets/animations/onboarding_image_2.gif',
                  title:
                      'The Best Results and Your\nSatisfaction is Our Top Priority',
                  description:
                      'We are dedicated to delivering the best results\nwith a focus on quality and precision.',
                ),
                OnboardingPageContent(
                  imagePath: 'lib/assets/animations/onboarding_image_3.gif',
                  title: "Let's Make Awesome Changes\nto Your Home",
                  description:
                      "Let's transform your home into something\namazing with expert craftsmanship solutions!",
                ),
              ],
            ),
          ),

          // Indicador de página
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const WormEffect(
              activeDotColor: Color(0xFFFEA800),
              dotHeight: 7,
              dotWidth: 7,
            ),
          ),

          const SizedBox(height: 20),

          // Botón "Create Account"
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

          const SizedBox(height: 20),

          // Botón "Already Have an Account"
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

          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
