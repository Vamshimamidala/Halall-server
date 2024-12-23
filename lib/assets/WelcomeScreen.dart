import 'package:flutter/material.dart';
import 'package:halal_app/assets/CustomScaffold.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // Function to handle login
  Future<void> _login(BuildContext context, String email, String password) async {
    final url = Uri.parse('https://test-5-p6sv.onrender.com/login'); // Replace with your API endpoint
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = responseData['token'];
      final msg = responseData['msg'];

      if (msg == "Login successful") {
        // Navigate to dashboard if login is successful
        Navigator.pushReplacementNamed(context, '/dashbord');
      } else {
        // Show error message
        _showError(context, msg);
      }
    } else {
      _showError(context, "Login failed");
    }
  }

  // Function to show error messages
  void _showError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Customscaffold(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Login Box
              Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Image.asset('lib/assets/Hglogo.png'),
                      const SizedBox(height: 8),
                      _buildTextField('Email', controller: emailController),
                      const SizedBox(height: 10),
                      _buildTextField('Password', isPassword: true, controller: passwordController),
                      const SizedBox(height: 0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/forgotpass');
                          },
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 7),
                          ),
                          onPressed: () {
                            _login(context, emailController.text, passwordController.text);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/register');
                            },
                            child: const Text('Register'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable method to build TextFields
  Widget _buildTextField(String labelText, {bool isPassword = false, required TextEditingController controller}) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}