import 'package:flutter/material.dart';
import 'package:nutrition/constants/constant.dart';
import 'package:nutrition/screens/userState.dart';
import 'package:nutrition/widgets/customButton.dart';
import 'package:nutrition/widgets/threeDot.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

List<String> gender = ["Male", "Female"];

class _UserDataState extends State<UserData> {
  String currentOption = gender[0];

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Name Field
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: "First Name",
                hintStyle: TextStyle(color: secondaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
              ),
              keyboardType: TextInputType.name, // Keyboard type for name
            ),
            const SizedBox(height: 13),

            // Last Name Field
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: "Last Name",
                hintStyle: TextStyle(color: secondaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
              ),
              keyboardType: TextInputType.name, // Keyboard type for name
            ),
            const SizedBox(height: 13),

            // Gender Selection
            const Row(
              children: [
                SizedBox(width: 13),
                Text(
                  'Gender',
                  style: TextStyle(color: secondaryColor, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      border: Border.all(color: primaryColor, width: 1.5),
                    ),
                    child: RadioListTile<String>(
                      title: const Text(
                        "Male",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      value: gender[0],
                      groupValue: currentOption,
                      onChanged: (value) {
                        setState(() {
                          currentOption = value!;
                        });
                      },
                      activeColor: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                    width: 20), // Space between the two RadioListTile
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      border: Border.all(color: primaryColor, width: 1.5),
                    ),
                    child: RadioListTile<String>(
                      title: const Text(
                        "Female",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      value: gender[1],
                      groupValue: currentOption,
                      onChanged: (value) {
                        setState(() {
                          currentOption = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),

            // Age Field
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                hintText: "Age",
                hintStyle: TextStyle(color: secondaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
              ),
              keyboardType:
                  TextInputType.number, // Keyboard type for number input
            ),
            const SizedBox(height: 13),

            // Height Field
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                hintText: "Height",
                hintStyle: TextStyle(color: secondaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 13),

            TextField(
              controller: weightController,
              decoration: const InputDecoration(
                hintText: "Weight",
                hintStyle: TextStyle(color: secondaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 13),

            const ThreeDot(index: 2),
            const SizedBox(height: 13),
            CustomButton(
                text: "Continue",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserState()));
                }),
            const SizedBox(height: 13),
            CustomButton(
              text: "Reset",
              onPressed: () {},
              color: thirdColor,
              textColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
