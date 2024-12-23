import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Getting the device's screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05), // Responsive padding
        height: screenSize.height * 0.38, // 40% of the page height
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 3),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromRGBO(0, 0, 0, 0.20),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: const Color(0xFFE3F5E4), // Card background color
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.01, // Responsive vertical padding
              horizontal:
                  screenSize.width * 0.05, // Responsive horizontal padding
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              children: [
                _buildPasswordTextField(
                  controller: _currentPasswordController,
                  hint: 'Enter Current Password',
                  isVisible: _isCurrentPasswordVisible,
                  onVisibilityToggle: () {
                    setState(() {
                      _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                    });
                  },
                ),
                const SizedBox(height: 14),
                _buildPasswordTextField(
                  controller: _newPasswordController,
                  hint: 'Enter New Password',
                  isVisible: _isNewPasswordVisible,
                  onVisibilityToggle: () {
                    setState(() {
                      _isNewPasswordVisible = !_isNewPasswordVisible;
                    });
                  },
                ),
                const SizedBox(height: 14),
                _buildPasswordTextField(
                  controller: _confirmPasswordController,
                  hint: 'Confirm New Password',
                  isVisible: _isConfirmPasswordVisible,
                  onVisibilityToggle: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
                const SizedBox(height: 14),
                // Submit Button
                Container(
                  height:screenSize.height * 0.068,

                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add submit action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF47A851),
                        minimumSize: const Size(170, 30), // Adjusted size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Submit',style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,            // font-size: 14px
                        fontWeight: FontWeight.w600, // font-weight: 600
                        fontStyle: FontStyle.normal, // font-style: normal
                        height: 1.0,             // line-height: normal (1.0 is the default line height multiplier)
                      ),),
                    ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField({
    required TextEditingController controller,
    required String hint,
    required bool isVisible,
    required VoidCallback onVisibilityToggle,
  }) {
    return Container(
      height: 40,
      child: TextField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFF888888),
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            height: 1.0,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(0, 0, 0, 0.10),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(0, 0, 0, 0.20),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(9.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(9.0),
          ),
          prefixIcon: const Icon(Icons.key, color: Color(0xFF888888)),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: const Color(0xFF3565CD),
            ),
            onPressed: onVisibilityToggle,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        ),
      ),
    );
  }

}