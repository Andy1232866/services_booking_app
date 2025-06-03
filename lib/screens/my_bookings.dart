import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:services_booking_app/widgets/status_selector.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  List<dynamic> bookings = [];
  String selectedStatus = 'Upcoming';

  @override
  void initState() {
    super.initState();
    _fetchBookingsWithStatus(selectedStatus);
  }

  Future<void> _fetchBookingsWithStatus(String status) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final response = await Supabase.instance.client
        .from('Bookings')
        .select('*, Services(*)')
        .eq('user_id', userId)
        .eq('state', status);

    setState(() {
      bookings = response ?? [];
      selectedStatus = status;
    });
  }

  Color _getColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatusSelector(
          onStatusChanged: _fetchBookingsWithStatus,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: bookings.isEmpty
              ? const Center(child: Text('No hay reservas con este estado.'))
              : ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (_, index) {
              final b = bookings[index];
              final s = b['Services'];
              final status = b['state'];

              return Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    s['image_person'] != null
                        ? Image.asset(s['image_person'], width: 80, height: 80)
                        : const Icon(Icons.person, size: 60),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(s['service_name'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(s['person_name'] ?? ''),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: _getColor(status).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: _getColor(status),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
