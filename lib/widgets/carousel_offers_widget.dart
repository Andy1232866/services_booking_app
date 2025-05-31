import 'package:flutter/material.dart';

class CarouselOffersWidget extends StatefulWidget {
  final int discount;
  final String description;
  final String imagePath;

  const CarouselOffersWidget({
    super.key,
    required this.discount,
    required this.description,
    required this.imagePath,
  });

  @override
  State<CarouselOffersWidget> createState() => _CarouselOffersWidgetState();
}

class _CarouselOffersWidgetState extends State<CarouselOffersWidget> {
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
          padding: const EdgeInsets.only(right: 30.0, left: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.discount}%',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    'Today\'s Special!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(widget.description, style: TextStyle(fontSize: 12)),
                ],
              ),
              Image.asset(widget.imagePath, width: 100, height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
