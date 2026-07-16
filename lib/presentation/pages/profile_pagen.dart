import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
              SizedBox(height: 16),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text('john@example.com'),
            ],
          ),
        ),
      ),
    );
  }
}