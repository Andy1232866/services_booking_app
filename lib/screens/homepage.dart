import 'package:flutter/material.dart';
import 'package:services_booking_app/widgets/navigator_bar.dart';
import 'package:services_booking_app/screens/my_bookings.dart';
import 'package:services_booking_app/screens/my_home.dart';
import 'package:services_booking_app/screens/my_calendar.dart';
import 'package:services_booking_app/screens/inbox.dart';
import 'package:services_booking_app/screens/profile.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    MyHome(),
    MyBookings(),
    MyCalendar(),
    Inbox(),
    Profile(),
  ];

  Map<String, dynamic>? userNamed;

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        setState(() {
          userNamed = doc.data();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(_selectedIndex),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigatorBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  PreferredSizeWidget? getAppBar(int index) {
    switch (index + 1) {
      case 1:
        return AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.red),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getGreeting(), style: TextStyle(fontSize: 12)),
                      Text(
                        userNamed != null ? userNamed!['username'] ?? '' : '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.notifications_outlined),
                  Icon(Icons.bookmark_border_outlined),
                ],
              ),
            ],
          ),
        );
      case 2:
        return AppBar(
          title: const Text(
            'Bookings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        );
      case 3:
        return AppBar(
          title: const Text(
            'Calendar',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        );
      case 4:
        return AppBar(
          title: const Text(
            'Inbox',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        );
      case 5:
        return AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        );
      default:
        return AppBar(
          title: const Text(
            'Error!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        );
    }
  }

  /*
  Método para obtener la hora:
  1. En la variable hora guardamos la hora actual del momento (en vivo)
  2. Si la hora es mayor o igual a las 5hrs y menos a las 12hrs entonces retorna "Buenos días"
  3. Si la hora es mayor o igual a las 12hrs y menor a las 18hrs entonces retorna "Buenas tardes"
  4. Si ninfuno de los 2 se cumple entonces retorna buenas noches
   */
  String getGreeting() {
    final hour = DateTime.now().hour; // Obtiene la hora

    if (hour >= 5 && hour < 12) {
      // De 5hrs a 12hrs es buenos días
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      // de 12hrs a 18hrs es buenas tardes
      return 'Good Afternoon';
    } else {
      return 'Good Night'; // Si no es ninguno entonces buenas noches
    }
  }
}
