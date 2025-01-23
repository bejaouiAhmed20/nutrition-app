import 'package:flutter/material.dart';
import 'package:nutrition/constants/constant.dart';

class BuildCustomListTile extends StatelessWidget {
  final String title;
  final String value;
  const BuildCustomListTile(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(9)),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: primaryColor,
            fontSize: 20,
          ),
        ),
        trailing: Text(
          value,
          style: const TextStyle(
            color: secondaryColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
