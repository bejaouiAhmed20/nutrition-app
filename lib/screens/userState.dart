import 'package:flutter/material.dart';
import 'package:nutrition/constants/constant.dart';
import 'package:nutrition/screens/navigationMenu.dart';
import 'package:nutrition/widgets/customButton.dart';
import 'package:nutrition/widgets/customListTile.dart';
import 'package:nutrition/widgets/threeDot.dart';

class UserState extends StatefulWidget {
  const UserState({super.key});

  @override
  State<UserState> createState() => _UserStateState();
}

class _UserStateState extends State<UserState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your Status",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              const BuildCustomListTile(title: 'Daily Calories', value: "2000"),
              const SizedBox(height: 13),
              const BuildCustomListTile(title: 'Daily Protein', value: "20g"),
              const SizedBox(height: 13),
              const BuildCustomListTile(title: 'Daily Carbs', value: "20g"),
              const SizedBox(height: 13),
              const BuildCustomListTile(title: 'Daily Fat', value: "20g"),
              const SizedBox(height: 13),
              const ThreeDot(index: 3),
              const SizedBox(height: 13),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationMenu()));
                },
                text: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
