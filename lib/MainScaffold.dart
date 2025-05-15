import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'orders.dart';
import 'profile.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    FoodHomeScreen(),
    SearchPage(),
    Orders(),
    ProfilePage(),
  ];

  final List<String> labels = ['Home', 'Search', 'Orders', 'Profile'];
  final List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.shopping_bag,
    Icons.person
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildSideNavItem(int index) {
    final bool isSelected = selectedIndex == index;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(
                icons[index],
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
              const SizedBox(width: 12),
              Text(
                labels[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[700],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      
      return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: PhysicalModel(
            color: Colors.white,
            elevation: 10,
            borderRadius: BorderRadius.circular(30),
            shadowColor: Colors.black54,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: _onItemTapped,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: Colors.orange,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                items: [
                  for (int i = 0; i < labels.length; i++)
                    BottomNavigationBarItem(
                      icon: Icon(icons[i]),
                      label: labels[i],
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      
      return Scaffold(
        body: Row(
          children: [
            Container(
              width: 220,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  ...List.generate(
                      labels.length, (index) => buildSideNavItem(index)),
                ],
              ),
            ),
            Expanded(
              child: pages[selectedIndex],
            ),
          ],
        ),
      );
    }
  }
}
