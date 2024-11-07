// profile_screen.dart

import 'package:flutter/material.dart';
import '../auth_service.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService _authService = AuthService(); // Removed const keyword

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Logged in as: ${user?.email ?? 'Unknown'}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Add functionality to change the password if needed
              },
              child: const Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
