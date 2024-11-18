import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/core/configs/theme/app_colors.dart';

class SearchOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SearchOption(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : AppColors.secondBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
