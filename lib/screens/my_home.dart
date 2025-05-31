import 'package:flutter/material.dart';
import 'package:services_booking_app/widgets/carousel_offers_widget.dart';
import 'package:services_booking_app/widgets/carousel_services_widget.dart';
import 'package:services_booking_app/widgets/see_all_widget.dart';
import 'package:services_booking_app/widgets/services_widget.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Here',
                hintStyle: TextStyle(
                  color: Color(0xFF787A7D),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: const Color(0xFF787A7D),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.tune_outlined, color: Color(0xFF787A7D)),
                  onPressed: () {
                    debugPrint('Test');
                  },
                ),
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SeeAllWidget(section: 'Special Offers', redirect: '/offers'),

            SizedBox(
              height: 125, // altura fija necesaria
              child: CarouselView.weighted(
                backgroundColor: Color(0xFFF5F5F5),
                flexWeights: [1],
                itemSnapping: true,
                shrinkExtent: 320,
                children: [
                  CarouselOffersWidget(
                    discount: 30,
                    description:
                        'Get discount for every\norder. Only valid for today',
                    imagePath: 'lib/assets/images/imagen_1.png',
                  ),

                  CarouselOffersWidget(
                    discount: 20,
                    description: 'Weekend deal only.\nDon’t miss out',
                    imagePath: 'lib/assets/images/imagen_2.png',
                  ),
                ],
              ),
            ),

            SeeAllWidget(section: 'Services', redirect: '/all_services'),

            ServicesWidget(),

            SizedBox(height: 10),

            SeeAllWidget(
              section: 'Most Popular Services',
              redirect: '/popular_services',
            ),

            SizedBox(
              height: 125, // altura fija necesaria
              child: CarouselView.weighted(
                backgroundColor: Color(0xFFF5F5F5),
                flexWeights: [1],
                itemSnapping: true,
                shrinkExtent: 320,
                children: [
                  CarouselServicesWidget(
                    imagePath: 'lib/assets/images/persona_1d.png',
                    personName: 'Alejandra',
                    serviceName: 'Laundry',
                    price: 70,
                    stars: 4.9,
                    reviews: 300,
                  ),
                  CarouselServicesWidget(
                    imagePath: 'lib/assets/images/persona_3d.png',
                    personName: 'Carlos',
                    serviceName: 'Plumbing',
                    price: 120,
                    stars: 4.7,
                    reviews: 210,
                  ),

                  CarouselServicesWidget(
                    imagePath: 'lib/assets/images/persona_2d.png',
                    personName: 'Andrea',
                    serviceName: 'House Cleaning',
                    price: 90,
                    stars: 5.0,
                    reviews: 180,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
