import 'package:flutter/material.dart';
import 'package:services_booking_app/widgets/text_form_field_custom.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final TextEditingController _emailOrPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('Enter your mail or phone number'),
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
                  ],
                ),
              ),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/verification');
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1.0,
                  backgroundColor: const Color(0xFFFEA800),
                  minimumSize: const Size(300, 50),
                  splashFactory: NoSplash.splashFactory,
                ),
                child: const Text(
                  'Send Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
