import 'package:flutter/material.dart';

class StatusSelector extends StatefulWidget {
  final Function(String) onStatusChanged;

  const StatusSelector({super.key, required this.onStatusChanged});

  @override
  State<StatusSelector> createState() => _StatusSelectorState();
}

class _StatusSelectorState extends State<StatusSelector> {
  final List<String> statuses = ['Upcoming', 'Completed', 'Cancelled'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderWidth: 0,
      borderColor: Colors.transparent,
      isSelected: List.generate(
        statuses.length,
            (index) => index == selectedIndex,
      ),
      onPressed: (index) {
        widget.onStatusChanged(statuses[index]);

        if (selectedIndex != index) {
          setState(() {
            selectedIndex = index;
          });
        }
      },
      selectedColor: Colors.orange,
      selectedBorderColor: Colors.transparent,
      splashColor: Colors.transparent,
      fillColor: Theme.of(context).scaffoldBackgroundColor,
      children: statuses.asMap().entries.map((entry) {
        int idx = entry.key;
        String status = entry.value;

        bool selected = idx == selectedIndex;

        return Container(
          width: 110,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? Colors.orange : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(status, textAlign: TextAlign.center, style: selected ? TextStyle(fontWeight: FontWeight.bold) : TextStyle(),),
        );
      }).toList(),
    );
  }
}
