import 'package:flutter/material.dart';
import 'package:halal_app/assets/CustomScaffold.dart';

class Thankyouregister extends StatelessWidget {
  const Thankyouregister ({super.key});

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
                      const Text(
                        "Thank You for Registering",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff252525),
                          height: 21/18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Verify your email address by clicking on the link sent to info@foodiesadda.com",
                        style: TextStyle(
                          fontSize: 13, // Replace with your desired font size
                          fontWeight: FontWeight.normal, // Replace with your desired weight
                          color: Color(0xff252525),
                          height: 1.5, // Adjust the line height (38/Symbol means around 1.5x line height)
                        ),
                        textAlign: TextAlign.center, // Justifies the text
                      ),
                      const SizedBox(height: 6),





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
                            'Resend Verification Email',
                            style: TextStyle(fontSize: 16), // Slightly increase button text size
                          ),
                        ),
                      ),
                      const SizedBox(height: 0),

                      // Register option

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

