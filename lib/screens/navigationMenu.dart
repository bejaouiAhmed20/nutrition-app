import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:nutrition/constants/constant.dart'; // Ensure primaryColor and secondaryColor are defined
import 'package:nutrition/screens/homePage.dart';
import 'package:nutrition/screens/recipePage.dart';
import 'package:nutrition/screens/tracker.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _currentIndex = 0;
  final _pages = <Widget>[
    const HomePage(),
    const Recipepage(),
    const Tracker(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              );
            }
            return const TextStyle(
              color: secondaryColor,
            );
          }),
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(
                Iconsax.home,
                color: _currentIndex == 0 ? primaryColor : secondaryColor,
              ),
              label: 'Home',
              selectedIcon: const Icon(
                Iconsax.home,
                color: primaryColor,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.element_3,
                color: _currentIndex == 1 ? primaryColor : secondaryColor,
              ),
              label: 'Recipes',
              selectedIcon: const Icon(
                Iconsax.element_3,
                color: primaryColor,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.diagram,
                color: _currentIndex == 2 ? primaryColor : secondaryColor,
              ),
              label: 'Profile',
              selectedIcon: const Icon(
                Iconsax.diagram,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}
