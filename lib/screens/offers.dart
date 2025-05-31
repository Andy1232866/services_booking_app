import 'package:flutter/material.dart';
import 'package:services_booking_app/services/supabase_services.dart';
import 'package:services_booking_app/widgets/carousel_offers_widget.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final SupabaseServices _supabaseServices = SupabaseServices();

  late Future<List<Map<String, dynamic>>> _offersFuture;

  @override
  void initState() {
    super.initState();
    _offersFuture = _supabaseServices.getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exclusive Offers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/homepage');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _offersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay ofertas disponibles'));
          }

          final offers = snapshot.data!;

          return ListView.builder(
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];

              return Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
                child: CarouselOffersWidget(
                  discount: (offer['percent'] as num).toInt(),
                  description: offer['description'],
                  imagePath: offer['image_path'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
