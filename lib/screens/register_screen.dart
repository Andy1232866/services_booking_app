import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:services_booking_app/services/auth_services.dart';
import 'package:services_booking_app/screens/email_verification_screen.dart';
import 'package:services_booking_app/widgets/text_form_field_custom.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _emailOrPhone = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70.0),
              Text(
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('Start hiring by creating your account'),

              // Formulario
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    // Campo de Username
                    TextFormFieldCustom(
                      label: 'Username',
                      hintText: 'Create your username',
                      icon: Icons.person_outline,
                      controller: _username,
                    ),
                    // Campo de Email or Phone Number
                    const SizedBox(height: 15),
                    TextFormFieldCustom(
                      label: 'Email or Phone Number',
                      hintText: 'Enter your email or phone number',
                      icon: Icons.email_outlined,
                      controller: _emailOrPhone,
                    ),
                    const SizedBox(height: 15),
                    TextFormFieldCustom(
                      label: 'Password',
                      hintText: 'Create your password',
                      icon: Icons.lock_outline,
                      controller: _password,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  String email = _emailOrPhone.text.trim();
                  String password = _password.text.trim();

                  final AuthServices auth = AuthServices();

                  User? user = await auth.signUp(email, password);

                  if (user != null && context.mounted) {
                    debugPrint('Usuario creado con el email $email');
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => EmailVerificationScreen(email: email)),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1.0,
                  backgroundColor: const Color(0xFFFEA800),
                  minimumSize: const Size(300, 50),
                  splashFactory: NoSplash.splashFactory,
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
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Or using other method',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  AuthServices auth = AuthServices();

                  User? user = await auth.signInWithGoogle();

                  if (user != null) {
                    debugPrint('Bienvenido ${user.email}');

                    if (context.mounted) {
                      Navigator.pushReplacementNamed(context, '/homepage');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  minimumSize: const Size(300, 50),
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'lib/assets/icons/google_icon.png',
                        width: 20,
                        height: 20,
                      ),
                      const Text(
                        'Sign In with Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  elevation: 0.0,
                  minimumSize: const Size(300, 50),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'lib/assets/icons/facebook_icon.png',
                        width: 30,
                        height: 30,
                      ),
                      const Text(
                        'Sign In with Facebook',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
