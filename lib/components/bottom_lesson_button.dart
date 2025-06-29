import 'package:flutter/material.dart';

class BottomLessonButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final Color? buttonColor;
  final Icon buttonIcon;

  const BottomLessonButton({
    super.key,
    required this.onPressed,
    this.buttonText = 'Continue',
    this.buttonIcon = const Icon(Icons.arrow_forward_rounded),
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: buttonIcon,
        label: Text(buttonText),
        iconAlignment: IconAlignment.end,
        style: FilledButton.styleFrom(
          minimumSize: const Size(double.infinity, 56),
          // Only apply the button color if it's provided
          backgroundColor: buttonColor,
        ),
      ),
    );
  }
}
