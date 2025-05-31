import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:services_booking_app/firebase_options.dart';
import 'package:services_booking_app/screens/loading_screen.dart';
import 'package:services_booking_app/screens/register_screen.dart';
import 'package:services_booking_app/screens/login_screen.dart';
import 'package:services_booking_app/screens/onboarding_screen.dart';
import 'package:services_booking_app/screens/forgot_password_screen.dart';
import 'package:services_booking_app/screens/verification_screen.dart';
import 'package:services_booking_app/screens/homepage.dart';
import 'package:services_booking_app/screens/offers.dart';
import 'package:services_booking_app/screens/popular_services.dart';
import 'package:services_booking_app/screens/cleaning_page.dart';

import 'secrets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(url: url, anonKey: anonKey);

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
      // Ruta Inicial
      initialRoute: '/',

      // Todas mis rutas
      routes: {
        '/': (context) => const LoadingScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/register': (context) => Register(),
        '/login': (context) => const Login(),
        '/forgot': (context) => const Forgot(),
        '/verification': (context) => const Verification(),
        '/homepage': (context) => const HomePage(),
        '/offers': (context) => const Offers(),
        '/popular_services': (context) => const PopularServices(),
        '/cleaning': (context) => const CleaningPage(),
      },
    );
  }
}
