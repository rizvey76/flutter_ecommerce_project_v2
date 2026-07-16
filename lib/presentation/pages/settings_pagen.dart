import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            trailing: Switch(
              value: false,
              onChanged: null,
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: null,
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            trailing: Text('English'),
          ),
        ),
      ],
    );
  }
}