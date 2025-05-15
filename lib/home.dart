import 'package:assement_deepthi/notifi.dart';
import 'package:flutter/material.dart';

class FoodHomeScreen extends StatelessWidget {
  const FoodHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['All Items', 'Popular', 'Exclusive'];
    int selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("My Moulinex"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/burger-fries_1156651-722.jpg",
                    height: 200, width: double.infinity, fit: BoxFit.cover),
                const Positioned(
                  top: 20,
                  left: 20,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.restaurant)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(" 4.4/5 (455+)",
                          style: TextStyle(color: Colors.grey)),
                      Spacer(),
                      Text("See reviews", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: tabs
                        .map((tab) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: tabs.indexOf(tab) == selectedIndex
                                    ? Colors.orange
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(tab,
                                  style: TextStyle(
                                      color: tabs.indexOf(tab) == selectedIndex
                                          ? Colors.white
                                          : Colors.black)),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text("All items in Moulinex",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildFoodCard("Chicken burger", "\$8.50",
                            "31 min", "assets/1313839.jpg"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildFoodCard(
                            "Italian hot pizza",
                            "\$8.50",
                            "28 min",
                            "assets/37b660cb40988dda83c8d345f62c83da.jpg"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodCard(
      String title, String price, String time, String imgPath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imgPath,
                      height: 100, width: double.infinity, fit: BoxFit.cover)),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  color: Colors.orange,
                  child: Text(time,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(price, style: const TextStyle(color: Colors.orange)),
          const SizedBox(height: 4),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {},
            child: const Text("Buy now"),
          )
        ],
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text('No new notifications'),
      ),
    );
  }
}
