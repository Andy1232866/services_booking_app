import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:services_booking_app/services/calendar_service.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime today = DateTime.now();
  List<dynamic> bookingsForSelectedDay = [];

  @override
  void initState() {
    super.initState();
    _loadBookings(today);
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
    _loadBookings(day);
  }

  void _loadBookings(DateTime day) async {
    final firebaseUid = FirebaseAuth.instance.currentUser?.uid;
    if (firebaseUid == null) {
      debugPrint('No hay usuario autenticado en Firebase');
      setState(() {
        bookingsForSelectedDay = [];
      });
      return;
    }

    final bookings = await fetchBookingsForDay(day, firebaseUid);
    setState(() {
      bookingsForSelectedDay = bookings;
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return const Color(0xFFFEA800); // upcoming
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFFFFF4E6),
              ),
              child: TableCalendar(
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: false,
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 01, 01),
                lastDay: DateTime.utc(2030, 12, 31),
                onDaySelected: _onDaySelected,
                selectedDayPredicate: (day) => isSameDay(day, today),
              ),
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Service Booking',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          const SizedBox(height: 15),

          if (bookingsForSelectedDay.isNotEmpty)
            ...bookingsForSelectedDay.map(
              (booking) => Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 20.0),
                child: Row(
                  children: [
                    Image.asset(
                      '${booking['Services']['image_person']}',
                      width: 80,
                      height: 80,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${booking['Services']['service_name']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text('${booking['Services']['person_name']}'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusColor(
                              booking['state'],
                            ).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "${booking['state']}",
                            style: TextStyle(
                              color: _getStatusColor(booking['state']),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          else
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/images/clipboard_empty.png',
                      width: 125,
                      height: 125,
                    ),
                    Text(
                      'You have no service booking',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text("You don't have a service booking on this date"),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
