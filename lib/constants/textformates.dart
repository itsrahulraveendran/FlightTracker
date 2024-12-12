import 'package:flutter/material.dart';

class FromToTextRow extends StatelessWidget {
  final String fromText;
  final String toText;
  final TextStyle textStyle;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const FromToTextRow({
    Key? key,
    required this.fromText,
    required this.toText,
    this.textStyle = const TextStyle(fontSize: 16, color: Colors.white),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(fromText, style: textStyle),
        SizedBox(
          height: 5,
        ),
        Text(toText, style: textStyle),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class IconRow extends StatelessWidget {
  final List<IconWithText> items;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const IconRow({
    Key? key,
    required this.items,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: items,
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle textStyle;
  final double iconSize;
  final Color iconColor;

  const IconWithText({
    Key? key,
    required this.icon,
    required this.text,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.white),
    this.iconSize = 24.0,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: iconSize, color: iconColor),
        SizedBox(height: 4), // Spacing between icon and text
        Text(text, style: textStyle),
      ],
    );
  }
}
