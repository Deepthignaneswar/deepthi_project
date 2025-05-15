import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.orange.shade200,
                child: const Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Deepthi G',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'deepthi@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 30),
              _buildProfileOption(Icons.edit, 'Edit Profile', context),
              const SizedBox(height: 15),
              _buildProfileOption(Icons.lock, 'Change Password', context),
              const SizedBox(height: 15),
              _buildProfileOption(Icons.settings, 'Settings', context),
              const SizedBox(height: 15),
              _buildProfileOption(Icons.logout, 'Logout', context,
                  isLogout: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, BuildContext context,
      {bool isLogout = false}) {
    return InkWell(
      onTap: () {
    
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title tapped')),
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: isLogout ? Colors.orange.shade50 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: isLogout ? Colors.orange : Colors.black54),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isLogout ? Colors.orange : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,
                size: 16, color: isLogout ? Colors.orange : Colors.grey),
          ],
        ),
      ),
    );
  }
}
