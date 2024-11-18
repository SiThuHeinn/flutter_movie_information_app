import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TitleLabel extends StatelessWidget {
  final String title;
  const TitleLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
