import 'package:flutter/material.dart';
import 'home.dart'; 

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  final List<Map<String, String>> notifications = const [
    {
      'title': 'Order Delivered',
      'subtitle': 'Your order #1234 has been delivered successfully.',
    },
    {
      'title': 'New Message',
      'subtitle': 'You have received a new message from Support.',
    },
    {
      'title': 'Discount Offer',
      'subtitle': 'Get 20% off on your next purchase. Limited time only!',
    },
    {
      'title': 'Order Shipped',
      'subtitle': 'Your order #5678 has been shipped and is on its way.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            
            Navigator.pop(context);
          },
        ),
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                'No notifications yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return ListTile(
                  leading: const Icon(
                    Icons.notifications,
                    color: Colors.orange,
                  ),
                  title: Text(
                    notification['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(notification['subtitle']!),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tapped: ${notification['title']}'),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
