

import 'package:flutter/cupertino.dart';

class ReleaseDateLabel extends StatelessWidget {
  final double fontSize;
  final String releaseDate;

  const ReleaseDateLabel({
    super.key,
    required this.releaseDate,
    this.fontSize = 14
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.calendar,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          releaseDate,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
