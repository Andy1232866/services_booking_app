import 'package:flutter/material.dart';

class SeeAllWidget extends StatefulWidget {
  final String section;
  final String redirect;

  const SeeAllWidget({
    super.key,
    required this.section,
    required this.redirect,
  });

  @override
  State<SeeAllWidget> createState() => _SeeAllWidgetState();
}

class _SeeAllWidgetState extends State<SeeAllWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.section,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, widget.redirect);
          },
          // Quitamos los márgenes que tiene por defecto para que sea de acorde a nuestro padding general
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(0, 0),
          ),
          child: Text(
            'See All',
            style: TextStyle(
              color: Color(0xFFFEA800),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
