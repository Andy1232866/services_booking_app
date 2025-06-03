import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateBooking {
  final supabase = Supabase.instance.client;

  Future<bool> createBooking({
    required String userId,
    required int serviceId,
    required DateTime date,
    required String state,
  }) async {
    try {
      final response = await supabase
          .from('Bookings')
          .insert({
        'user_id': userId,
        'service_id': serviceId,
        'date': date.toIso8601String(),
        'state': state ,
      })
          .select()
          .maybeSingle();

      // response es un Map si éxito, null si falló
      if (response == null) {
        debugPrint('Insert failed, response is null');
        return false;
      }

      debugPrint('Insert success: $response');
      return true;
    } catch (e) {
      debugPrint('Exception in createBooking: $e');
      return false;
    }
  }
}
