import 'package:flutter/material.dart';
import 'package:halal_app/assets/CustomScaffold.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword ({super.key});

  @override
  Widget build(BuildContext context) {
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
                      // Email field
                      _buildTextField('Enter Recovery Email'),
                      const SizedBox(height: 10),




                      // Login button
                      SizedBox(
                        width: double.infinity, // Make button full width
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30), // Increase curvature
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 7), // Adjust vertical padding
                          ),
                          onPressed: () {
                            // Add login functionality
                          },
                          child: const Text(
                            'Request Resent Link',
                            style: TextStyle(fontSize: 16), // Slightly increase button text size
                          ),
                        ),
                      ),
                      const SizedBox(height: 0),

                      // Register option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Back to"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/welcomescreen');
                              // Add navigate to register screen functionality
                            },
                            child: const Text('Login'),
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
}
// Reusable method to build TextFields
Widget _buildTextField(String labelText, {bool isPassword = false}) {
  return SizedBox(
    height: 40, // Set fixed height for text field
    child: TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 16), // Increase label text size
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8), // Adjust content padding
      ),
      style: const TextStyle(fontSize: 16), // Keep text size at a reasonable level
    ),
  );
}


