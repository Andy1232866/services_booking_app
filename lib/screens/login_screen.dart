import 'package:flutter/material.dart';
import 'package:services_booking_app/widgets/text_form_field_custom.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                'Login Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('Please login with registered account'),
              // Formulario
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Campo de Email or Phone Number
                    const SizedBox(height: 80),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/forgot');
                    },
                    style: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Color(0xFFFF8A00),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 1.0,
                  backgroundColor: const Color(0xFFFEA800),
                  minimumSize: const Size(300, 50),
                  splashFactory: NoSplash.splashFactory,
                ),
                child: const Text(
                  'Sign In',
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
                onPressed: () {},
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
