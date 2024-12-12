import 'package:flutter/material.dart';

class IconandText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;
  final double iconSize;
  final double textSize;

  // Constructor to initialize the icon, text, and styling properties
  const IconandText({
    Key? key,
    required this.icon,
    required this.text,
    this.iconColor = Colors.white, // Default color for the icon
    this.textColor = Colors.white, // Default color for the text
    this.iconSize = 24.0, // Default icon size
    this.textSize = 16.0, // Default text size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // To make the row size fit the content
      children: [
        Icon(
          icon,
          color: iconColor, // Use the color passed to the widget
          size: iconSize, // Set the icon size
        ),
        const SizedBox(width: 8), // Adds spacing between icon and text
        Text(
          text,
          style: TextStyle(
            color: textColor, // Use the color passed to the widget
            fontSize: textSize, // Set the text size
          ),
        ),
      ],
    );
  }
}
