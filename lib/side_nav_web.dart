import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const SideNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final List<_NavItem> navItems = const [
    _NavItem(Icons.home, 'Home'),
    _NavItem(Icons.search, 'Search'),
    _NavItem(Icons.fastfood, 'Food'),
    _NavItem(Icons.bookmark, 'Bookmarks'),
    _NavItem(Icons.person_2_outlined, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          final bool isSelected = selectedIndex == index;
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onItemSelected(index),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.orange : Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(item.icon,
                        color: isSelected ? Colors.white : Colors.black),
                    const SizedBox(width: 10),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem(this.icon, this.label);
}
