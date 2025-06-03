import 'package:flutter/material.dart';
import 'package:services_booking_app/services/auth_services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: [

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/icons/user.png',
                          width: 24,
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Your Profile',
                            style: TextStyle(
                              color: Color(0xFF787A7D),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF787A7D),
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/icons/bell.png',
                          width: 24,
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Notifications',
                            style: TextStyle(
                              color: Color(0xFF787A7D),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF787A7D),
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 25),
      
                Divider(color: Color(0xFFF5F5F5)),

                const SizedBox(height: 25),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/icons/credit-card.png',
                          width: 24,
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Payment',
                            style: TextStyle(
                              color: Color(0xFF787A7D),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF787A7D),
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/icons/shield.png',
                          width: 24,
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Security',
                            style: TextStyle(
                              color: Color(0xFF787A7D),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF787A7D),
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/icons/language.png',
                          width: 24,
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Language',
                            style: TextStyle(
                              color: Color(0xFF787A7D),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'English',
                          style: TextStyle(color: Color(0xFF787A7D)),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF787A7D),
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Divider(color: Color(0xFFF5F5F5),),

                const SizedBox(height: 25),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/icons/lock.png',
                          width: 24,
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                color: Color(0xFF787A7D),
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF787A7D),
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 25),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/icons/help.png',
                          width: 24,
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Help Center',
                            style: TextStyle(
                                color: Color(0xFF787A7D),
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF787A7D),
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 25),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/icons/users.png',
                          width: 24,
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Invite Friends',
                            style: TextStyle(
                                color: Color(0xFF787A7D),
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF787A7D),
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 25),
      
                GestureDetector(
                  onTap: () async {
                    final AuthServices auth = AuthServices();
                    await auth.signOut();

                    if (context.mounted) {
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'lib/assets/icons/logout.png',
                            width: 24,
                            height: 24,
                            color: Colors.red[300],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                  color: Colors.red[300],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
