import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.auth});

  final AuthService auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        actions: [
          IconButton(
            onPressed: () async {
              await auth.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}