import 'package:flutter/material.dart';
import 'package:services_booking_app/widgets/carousel_custom_widget.dart';
import 'package:services_booking_app/widgets/services_widget.dart';
import 'package:services_booking_app/widgets/see_all_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    Text('Good Morning', style: TextStyle(fontSize: 12)),
                    Text(
                      'Adison Rosser',
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
      ),
      body: Padding(
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
            const SizedBox(height: 15),

            SeeAllWidget(section: 'Special Offers', redirect: '/offers'),

            SizedBox(
              height: 150, // altura fija necesaria
              child: CarouselView.weighted(
                backgroundColor: Color(0xFFF5F5F5),
                flexWeights: [1],
                itemSnapping: true,
                shrinkExtent: 320,
                children: [
                  CarouselCustomWidget(
                    discount: '30%',
                    description:
                        'Get discount for every\norder. Only valid for today',
                    imagePath: 'lib/assets/images/imagen_1.png',
                  ),

                  CarouselCustomWidget(
                    discount: '20%',
                    description: 'Weekend deal only.\nDon’t miss out',
                    imagePath: 'lib/assets/images/imagen_2.png',
                  ),

                  CarouselCustomWidget(
                    discount: '10%',
                    description: 'Book now and get\ninstant cashback',
                    imagePath: 'lib/assets/images/imagen_3.png',
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
          ],
        ),
      ),
    );
  }
}
