import 'package:flutter/material.dart';
import 'package:services_booking_app/screens/service_details_page.dart';
import 'package:services_booking_app/services/supabase_services.dart';
import 'package:services_booking_app/widgets/carousel_services_widget.dart';

class PopularServices extends StatefulWidget {
  const PopularServices({super.key});

  @override
  State<PopularServices> createState() => _PopularServicesState();
}

class _PopularServicesState extends State<PopularServices> {
  final SupabaseServices _supabaseServices = SupabaseServices();

  late Future<List<Map<String, dynamic>>> _futureServices;

  @override
  void initState() {
    super.initState();
    _futureServices = _supabaseServices.getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Most Popular Services',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
        future: _futureServices,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 125,
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return const SizedBox(
              height: 125,
              child: Center(child: Text('Error loading services')),
            );
          }

          final services = snapshot.data!;

          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];

              return Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 15.0,
                  right: 10.0,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ServiceDetailsPage(serviceId: service['id']),
                      ),
                    );
                  },
                  child: CarouselServicesWidget(
                    imagePath: service['image_person'],
                    personName: service['person_name'],
                    serviceName: service['service_name'],
                    price: service['price'],
                    stars: (service['stars'] as num).toDouble(),
                    reviews: service['reviews'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
