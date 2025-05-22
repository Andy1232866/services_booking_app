import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  final String email;

  const EmailVerificationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Email Verification',
          style: TextStyle(
            color: Color(0xFFFEA800),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Color(0x33FEA800),
                      radius: 65.0,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFFEA800),
                        radius: 45.0,
                        child: Icon(
                          Icons.mark_email_read_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Verification Sent',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('Please verify your acount in the email'),
                  Text(email, style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1.0,
                  backgroundColor: const Color(0xFFFEA800),
                  minimumSize: const Size(300, 50),
                  splashFactory: NoSplash.splashFactory,
                ),
                child: const Text(
                  'Understood',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't receive the email?"),
                    TextButton(
                      onPressed: () {
                        debugPrint('test');
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: Color(0xFFFF8A00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
