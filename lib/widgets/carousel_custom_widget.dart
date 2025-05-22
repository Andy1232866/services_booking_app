import 'package:flutter/material.dart';

class CarouselCustomWidget extends StatefulWidget {
  final String discount;
  final String description;
  final String imagePath;

  const CarouselCustomWidget({
    super.key,
    required this.discount,
    required this.description,
    required this.imagePath,
  });

  @override
  State<CarouselCustomWidget> createState() => _CarouselCustomWidgetState();
}

class _CarouselCustomWidgetState extends State<CarouselCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.discount,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                'Today\'s Special!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                widget.description,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Image.asset(widget.imagePath),
        ],
      ),
    );
  }
}