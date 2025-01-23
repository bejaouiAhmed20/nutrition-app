import 'package:flutter/material.dart';
import 'package:nutrition/constants/constant.dart';

class ThreeDot extends StatelessWidget {
  final int index;
  const ThreeDot({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: index == 1 ? primaryColor : secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: index == 2 ? primaryColor : secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: index == 3 ? primaryColor : secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
