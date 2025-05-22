import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Test');
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFF2E9FF),
                    radius: 35,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFFF2E9FF),
                      child: Image.asset('lib/assets/icons/cleaning.png'),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'Cleaning',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFFEBF0),
                    radius: 35,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFFFFEBF0),
                      child: Image.asset('lib/assets/icons/painting.png'),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'Painting',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFFFAE5),
                    radius: 35,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFFFFFAE5),
                      child: Image.asset('lib/assets/icons/laundry.png'),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'Laundry',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFF7F0FB),
                    radius: 35,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFFF7F0FB),
                      child: Image.asset('lib/assets/icons/repairing.png'),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'Rapiring',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFFEDEC),
                    radius: 35,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFFFFEDEC),
                      child: Image.asset('lib/assets/icons/appliance.png'),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'Appliance',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFECFBEF),
                    radius: 35,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFFECFBEF),
                      child: Image.asset('lib/assets/icons/plumbing.png'),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'Plumbing',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFEAF6FD),
                    radius: 35,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFFEAF6FD),
                      child: Image.asset('lib/assets/icons/shifting.png'),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'Shifting',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0x33FEA800),
                    radius: 35,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFFEA800),
                      child: Icon(Icons.more_horiz_outlined, color: Colors.white,)
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'More',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
