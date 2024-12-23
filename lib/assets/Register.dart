import 'package:flutter/material.dart';
import 'package:halal_app/assets/CustomScaffold.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscurePassword = true; // Control for password visibility
  bool _obscureConfirmPassword = true; // Control for confirm password visibility

  @override
  Widget build(BuildContext context) {
    return Customscaffold(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 50),
                Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset('lib/assets/Hglogo.png'),
                        const SizedBox(height: 20),

                        // Input fields
                        _buildTextField('Business Name'),
                        const SizedBox(height: 10),
                        _buildTextField('Email'),
                        const SizedBox(height: 10),

                        // Password fields with eye icon
                        _buildPasswordField('Password', isConfirmPassword: false),
                        const SizedBox(height: 10),
                        _buildPasswordField('Confirm Password', isConfirmPassword: true),
                        const SizedBox(height: 10),
                        _buildTextField('Contact Number'),
                        const SizedBox(height: 10),
                        _buildTextField('Address'),
                        const SizedBox(height: 10),

                        // City and Postal Code side by side
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: _buildTextField('City'),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: _buildTextField('Postal Code'),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Register button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                            ),
                            onPressed: () {
                              // Add register functionality
                              Navigator.pushReplacementNamed(context, '/thankyou');
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Login option
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                // Navigate to login screen
                                Navigator.pushReplacementNamed(context, '/welcomescreen');
                              },
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to build general text fields
  Widget _buildTextField(String labelText, {bool isPassword = false}) {
    return Container(
      height: 40,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        ),
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  // Method to build password fields with eye icon toggle
  Widget _buildPasswordField(String labelText, {required bool isConfirmPassword}) {
    return Container(
      height: 40,
      child: TextField(
        obscureText: isConfirmPassword ? _obscureConfirmPassword : _obscurePassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          suffixIcon: IconButton(
            icon: Icon(
              isConfirmPassword
                  ? (_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility)
                  : (_obscurePassword ? Icons.visibility_off : Icons.visibility),
            ),
            onPressed: () {
              setState(() {
                if (isConfirmPassword) {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                } else {
                  _obscurePassword = !_obscurePassword;
                }
              });
            },
          ),
        ),
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}