import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getServices() async {
    try {
      final response = await supabase.from('Services').select();
      debugPrint('Servicios obtenidos: $response');
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('No se pudieron obtener los servicios');
    }
  }

  Future<List<Map<String, dynamic>>> getOffers() async {
    try {
      final response = await supabase.from('Offers').select();
      debugPrint('Ofertas obtenidos: $response');
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('No se pudieron obtener las ofertas');
    }
  }

  Future<Map<String, dynamic>?> getServiceById(int id) async {
    final response =
        await supabase
            .from('Services') // Mi bucket
            .select() // Select de toda la vida
            .eq('id', id) // Por ID
            .single(); // Un solo resultado

    return response;
  }
}
