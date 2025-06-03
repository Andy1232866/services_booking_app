import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

Future<List<dynamic>> fetchBookingsForDay(DateTime day, String firebaseUid) async {
  final start = DateTime(day.year, day.month, day.day);
  final end = start.add(const Duration(days: 1));

  try {
    final response = await Supabase.instance.client
        .from('Bookings')
        .select('*, Services(*)')
        .eq('user_id', firebaseUid)
        .gte('date', start.toIso8601String())
        .lt('date', end.toIso8601String());

    return response ?? [];
  } catch (e) {
    debugPrint('Error al consultar Supabase: $e');
    return [];
  }
}
