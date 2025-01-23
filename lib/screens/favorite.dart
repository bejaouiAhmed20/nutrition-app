import 'package:flutter/material.dart';
import 'package:nutrition/constants/constant.dart';
import 'package:nutrition/widgets/card.dart';
import 'package:nutrition/widgets/recipeCard.dart';

class Favorite extends StatefulWidget {
  final String source;
  const Favorite({super.key, required this.source});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          title: Text(widget.source),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
              widget.source == "Favorite Foods"
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return FoodCard(
                              text: "Apple",
                              image: 'assets/images/th.jpg',
                              onPressed: () {});
                        },
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: 100,
                          itemBuilder: (context, index) {
                            return RecipeCard(
                                title: "Apple",
                                description: "easy to make in just 3 min",
                                image: 'assets/images/th.jpg',
                                onPressed: () {});
                          })),
            ],
          ),
        ));
  }
}
