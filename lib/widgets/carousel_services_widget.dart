import 'package:flutter/material.dart';

class CarouselServicesWidget extends StatefulWidget {
  final String imagePath;
  final String personName;
  final String serviceName;
  final int price;
  final double stars;
  final int reviews;

  const CarouselServicesWidget({
    super.key,
    required this.imagePath,
    required this.personName,
    required this.serviceName,
    required this.price,
    required this.stars,
    required this.reviews,
  });

  @override
  State<CarouselServicesWidget> createState() => _CarouselServicesWidgetState();
}

class _CarouselServicesWidgetState extends State<CarouselServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 30.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(widget.imagePath, width: 100, height: 100,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(widget.personName),
                      const SizedBox(width: 70,),
                      Image.asset(
                        'lib/assets/icons/clipboard.png',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),

                  Text(
                    widget.serviceName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${widget.price}',
                    style: TextStyle(
                      color: Color(0xFFFEA800),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFEA800)),
                      Text('${widget.stars} (${widget.reviews} reviews)'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
