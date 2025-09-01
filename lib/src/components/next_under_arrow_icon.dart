import 'package:flutter/material.dart';

class NextUnderArrowIcon extends StatelessWidget {
  const NextUnderArrowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: const RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.arrow_right_alt,
          size: 45,
        ),
      ),
    );
  }
}
