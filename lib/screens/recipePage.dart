import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:nutrition/constants/constant.dart';
import 'package:nutrition/screens/favorite.dart';
import 'package:nutrition/screens/recipeDetailPage.dart';
import 'package:nutrition/widgets/recipeCard.dart';

class Recipepage extends StatefulWidget {
  const Recipepage({super.key});

  @override
  State<Recipepage> createState() => _RecipepageState();
}

class _RecipepageState extends State<Recipepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Recipes',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Favorite(
                              source: "Favorite Recipes",
                            )));
              },
              icon: const Icon(
                Iconsax.heart,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(children: [
          const TextField(
              decoration: InputDecoration(
            fillColor: thirdColor,
            hintText: "Search for foods...",
            hintStyle: TextStyle(
              color: secondaryColor,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: thirdColor)),
          )),
          const SizedBox(height: 27),
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                        title: "Apple",
                        description: "easy to make in just 3 min",
                        image: 'assets/images/th.jpg',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RecipeDetailsPage(
                                  imageUrl: 'assets/images/th.jpg',
                                  title: 'Delicious Pancakes',
                                  ingredients: [
                                    '2 cups all-purpose flour',
                                    '2 tablespoons sugar',
                                    '2 teaspoons baking powder',
                                    '1/2 teaspoon salt',
                                    '1 1/2 cups milk',
                                    '2 large eggs',
                                    '1/4 cup melted butter',
                                    '1 teaspoon vanilla extract',
                                  ],
                                  instructions: [
                                    'In a large bowl, mix the flour, sugar, baking powder, and salt.',
                                    'In another bowl, whisk together the milk, eggs, melted butter, and vanilla.',
                                    'Pour the wet ingredients into the dry ingredients and stir until combined.',
                                    'Heat a non-stick skillet over medium heat and lightly grease it.',
                                    'Pour 1/4 cup of batter onto the skillet for each pancake.',
                                    'Cook until bubbles appear on the surface, then flip and cook the other side.',
                                    'Serve warm with your favorite toppings.',
                                  ],
                                  nutritionalInfo: {
                                    'Calories': '350 kcal',
                                    'Protein': '6g',
                                    'Carbohydrates': '50g',
                                    'Fat': '10g',
                                    'Fiber': '2g',
                                  },
                                ),
                              ));
                        });
                  })),
        ]),
      ),
    );
  }
}
