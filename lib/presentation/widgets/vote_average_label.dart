

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoteAverageLabel extends StatelessWidget {
  final double fontSize;
  final double voteAverage;

  const VoteAverageLabel({
    super.key,
    required this.voteAverage,
    this.fontSize = 14
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          color: Colors.yellow,
          CupertinoIcons.star,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          voteAverage.toString(),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
