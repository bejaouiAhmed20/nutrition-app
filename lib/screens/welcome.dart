import 'package:flutter/material.dart';
import 'package:nutrition/constants/constant.dart';
import 'package:nutrition/screens/userData.dart';
import 'package:nutrition/widgets/customButton.dart';
import 'package:nutrition/widgets/threeDot.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/images/th.jpg')),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "All your",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "favorite foods",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Track meals and stay healthy",
              style: TextStyle(fontSize: 16, color: secondaryColor),
            ),
            const Text(
              "with our app.",
              style: TextStyle(fontSize: 16, color: secondaryColor),
            ),
            const SizedBox(
              height: 30,
            ),
            const ThreeDot(index: 1),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                text: "Continue",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserData()));
                })
          ],
        ),
      ),
    );
  }
}
