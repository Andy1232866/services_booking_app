import 'package:flutter/material.dart';
import 'package:services_booking_app/screens/loading_screen.dart';
import 'package:services_booking_app/screens/register_screen.dart';
import 'package:services_booking_app/screens/login_screen.dart';
import 'package:services_booking_app/screens/onboarding_screen.dart';
import 'package:services_booking_app/screens/forgot_password_screen.dart';
import 'package:services_booking_app/screens/verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Services Booking App',
      theme: ThemeData(
        useMaterial3: true,
        tabBarTheme: const TabBarTheme(indicatorColor: Colors.orange),
      ),
      initialRoute: '/', // Ruta Inicial
      routes: {
        '/': (context) => const LoadingScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/register': (context) => Register(),
        '/login': (context) => const Login(),
        '/forgot': (context) => const Forgot(),
        '/verification': (context) => const Verification(),
      },
    );
  }
}
