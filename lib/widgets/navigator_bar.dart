import 'package:flutter/material.dart';

class NavigatorBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavigatorBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFFEA800),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 0
                  ? 'lib/assets/icons/home_filled.png'
                  : 'lib/assets/icons/home.png',
              width: 24,
              height: 24,
              color: currentIndex == 0 ? Color(0xFFFEA800) : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 1
                  ? 'lib/assets/icons/clipboard_filled.png'
                  : 'lib/assets/icons/clipboard.png',
              width: 24,
              height: 24,
              color: currentIndex == 1 ? Color(0xFFFEA800) : Colors.grey,
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 2
                  ? 'lib/assets/icons/calendar_filled.png'
                  : 'lib/assets/icons/calendar.png',
              width: 24,
              height: 24,
              color: currentIndex == 2 ? Color(0xFFFEA800) : Colors.grey,
            ),
            label: 'Calendar'
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 3
                    ? 'lib/assets/icons/message_filled.png'
                    : 'lib/assets/icons/message.png',
                width: 24,
                height: 24,
                color: currentIndex == 3 ? Color(0xFFFEA800) : Colors.grey,
              ),
              label: 'Inbox'
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 4
                    ? 'lib/assets/icons/user_filled.png'
                    : 'lib/assets/icons/user.png',
                width: 24,
                height: 24,
                color: currentIndex == 4 ? Color(0xFFFEA800) : Colors.grey,
              ),
              label: 'Profile'
          ),
        ],
      ),
    );
  }
}
