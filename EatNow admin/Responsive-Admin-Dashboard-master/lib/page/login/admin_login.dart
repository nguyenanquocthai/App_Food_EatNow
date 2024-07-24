import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/screens/dash_board_screen.dart';

class AdminLoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  get http => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    String email = _usernameController.text;
    String password = _passwordController.text;

    // Set your hardcoded email and password
    String adminEmail = 'admin@gmail.com';
    String adminPassword = '123456';

    if (email == adminEmail && password == adminPassword) {
      // If email and password match, navigate to the admin dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashBoardScreen()),
      );
    } else {
      // If email and password do not match, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }
}
