import 'package:flutter/material.dart';
import 'package:nutrition/constants/constant.dart';

class RecipeDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final List<String> ingredients;
  final List<String> instructions;
  final Map<String, String> nutritionalInfo;

  const RecipeDetailsPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.nutritionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Ingredients Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ingredients
                    .map((ingredient) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "- $ingredient",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Instructions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Instructions",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: instructions
                    .asMap()
                    .entries
                    .map((entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "${entry.key + 1}. ${entry.value}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Nutritional Information Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Nutritional Information",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: nutritionalInfo.entries
                    .map((entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "${entry.key}: ${entry.value}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
