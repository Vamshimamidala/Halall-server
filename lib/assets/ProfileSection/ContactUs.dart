import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // Adjust width and padding dynamically based on screen width
          width: screenWidth < 400 ? screenWidth * 0.9 : 380,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF888888),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Us\nWe are HalalGuide LLC\n',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'If you have any questions, suggestions, or need further assistance, please feel free to reach out to us. We are here to help you and ensure you have the best experience with our app.\n',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Our Contact Information:\n\n'
                    'Address: Downtown Dubai, PO Box 123234 Dubai, UAE\n'
                    'Web: www.halalguide.io\n'
                    'Email: info@halalguide.io',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}