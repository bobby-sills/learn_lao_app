import 'package:flutter/material.dart';

class LaoLearningText extends StatelessWidget {
  final String text;
  final List<int> outlinedIndices;
  final double fontSize;
  final Color fillColor;
  final Color outlineColor;
  final double strokeWidth;

  const LaoLearningText({
    Key? key,
    required this.text,
    required this.outlinedIndices,
    this.fontSize = 32,
    this.fillColor = Colors.blue,
    this.outlineColor = Colors.blue,
    this.strokeWidth = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characters = text.characters;
    final characterCount = characters.length;
    List<TextSpan> spans = [];

    // Validate indices
    final validIndices = outlinedIndices
        .where((index) => index >= 0 && index < characterCount)
        .toSet();

    int index = 0;
    for (String char in characters) {
      bool isOutlined = validIndices.contains(index);

      spans.add(
        TextSpan(
          text: char,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: isOutlined ? null : fillColor,
            foreground: isOutlined
                ? (Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = strokeWidth
                    ..color = outlineColor)
                : null,
          ),
        ),
      );
      index++;
    }

    return Text.rich(
      TextSpan(children: spans),
      textDirection: TextDirection.ltr, // Explicit for clarity
    );
  }
}
