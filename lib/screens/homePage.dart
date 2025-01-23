import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:nutrition/constants/constant.dart';
import 'package:nutrition/screens/favorite.dart';
import 'package:nutrition/widgets/card.dart';
import 'package:nutrition/widgets/customListTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Home',
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
                                source: "Favorite Foods",
                              )));
                },
                icon: const Icon(
                  Iconsax.heart,
                  color: primaryColor,
                )),
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return FoodCard(
                  text: "Apple",
                  image: 'assets/images/th.jpg',
                  onPressed: () => _showBottomSheet(
                      context, 'assets/images/th.jpg', 'Apple'),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String image, String title) {
    setState(() {
      _controller.text = "100";
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: -15,
                  child: Container(
                    width: 150,
                    height: 7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  )),
              DraggableScrollableSheet(
                expand: false,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              image,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Iconsax.add_circle,
                                    color: primaryColor,
                                    size: 30,
                                  ))
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Quantity :",
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: _controller,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          const BuildCustomListTile(
                              title: 'Calories', value: "2000"),
                          const SizedBox(height: 16),
                          const BuildCustomListTile(
                              title: 'Protein', value: "20g"),
                          const SizedBox(height: 16),
                          const BuildCustomListTile(
                              title: 'Carbs', value: "20g"),
                          const SizedBox(height: 16),
                          const BuildCustomListTile(title: 'Fat', value: "20g"),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ]);
      },
    );
  }
}
