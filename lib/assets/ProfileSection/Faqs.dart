import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF252525)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "FAQs",
          style: TextStyle(color: Color(0xFF252525)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: 360, // Fixed width for the layout
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBoldText("General Questions"),
              _buildBoldText("Q1: What is HalalGuide for?"),
              _buildNormalText(
                  "A: HalalGuide helps you find halal business spots worldwide, including restaurants, cafés, mosques, candy shops, and more. It makes it easier for you to find halal-certified options that align with your dietary and lifestyle preferences."),
              SizedBox(height: 10),

              _buildBoldText("Q2: How do I create an account?"),
              _buildNormalText(
                  "A: Tap on the 'Sign Up' button on the home screen, fill in your details, and follow the instructions to create your account."),
              SizedBox(height: 10),

              _buildBoldText("Q3: Is the app free to use?"),
              _buildNormalText("A: Yes, downloading and using the app is free."),
              SizedBox(height: 10),

              _buildBoldText("Finding Halal Spots"),
              _buildBoldText("Q4: How do I search for halal spots?"),
              _buildNormalText(
                  "A: Use the search function to look for halal spots by category or location. You can also allow the app to access your location to show nearby spots."),
              SizedBox(height: 10),

              _buildBoldText("Q5: What do the Green, Yellow, and Red Halal Tags mean?"),
              _buildNormalText(
                  "A: Green Halal Tag: The restaurant offers 100% halal food, and no alcohol is served.\n"
                      "Yellow Halal Tag: All food is halal, but alcohol is served.\n"
                      "Red Halal Tag: Halal food is served alongside non-halal food, and alcohol is served."),
              SizedBox(height: 10),

              _buildBoldText("Q6: How accurate is the halal status information?"),
              _buildNormalText(
                  "A: The information is provided by the businesses themselves. While we strive for accuracy, we rely on the data provided by the business owners. If you find any discrepancies, please report them, and we will update the information accordingly."),
              SizedBox(height: 10),

              _buildBoldText("Using the Scanner Function"),
              _buildBoldText("Q7: How does the scanner function work?"),
              _buildNormalText(
                  "A: The scanner function allows you to scan product barcodes to view ingredients, daily values, and other product details. Ingredients are categorized by the Service Provider, but you can customize these classifications according to your beliefs."),
              SizedBox(height: 10),

              _buildBoldText("Q8: Can I change the classification of ingredients?"),
              _buildNormalText(
                  "A: Yes, you can customize the classification of ingredients in your user profile to match your dietary preferences."),
              SizedBox(height: 10),

              _buildBoldText("User Reviews and Ratings"),
              _buildBoldText("Q9: How do I leave a review or rating for a business?"),
              _buildNormalText(
                  "A: You need to register an account on HalalGuide. Once registered, you can leave reviews and rate businesses directly through their profile pages."),
              SizedBox(height: 10),

              _buildBoldText("Q10: How can I report incorrect information?"),
              _buildNormalText(
                  "A: Use the 'Report' feature on the business’s profile page, or contact us directly at info@halalguide.io."),
              SizedBox(height: 10),

              _buildBoldText("Offers and Promotions"),
              _buildBoldText("Q11: How can I find out about special deals?"),
              _buildNormalText(
                  "A: Special deals and promotions are listed in the 'Offers' section of the app. You can also subscribe to notifications to stay updated."),
              SizedBox(height: 10),

              _buildBoldText("Q12: How do I receive and use discount coupons?"),
              _buildNormalText(
                  "A: In HalalGuide, you can receive discount coupons directly through the app from participating halal spots. These coupons will be available within the app and can be redeemed at the specified locations for discounts or special offers. Simply show the digital coupon within the app at the spot to claim your discount. Make sure to check any specific terms and conditions associated with each coupon."),
              SizedBox(height: 10),

              _buildBoldText("Account and Settings"),
              _buildBoldText("Q13: How do I reset my password?"),
              _buildNormalText(
                  "A: Go to the login screen, tap on 'Forgot Password,' and follow the instructions to reset your password."),
              SizedBox(height: 10),

              _buildBoldText("Q14: How do I update my personal information?"),
              _buildNormalText(
                  "A: Navigate to 'Profile' and tap on 'Edit' to update your personal details."),
              SizedBox(height: 10),

              _buildBoldText("Q15: How do I delete my account?"),
              _buildNormalText(
                  "A: Contact customer support at info@halalguide.io to request account deletion."),
              SizedBox(height: 10),

              _buildBoldText("Technical Issues"),
              _buildBoldText("Q16: The app is not working properly. What should I do?"),
              _buildNormalText(
                  "A: Try restarting the app or your device. If the problem persists, check for updates or contact customer support."),
              SizedBox(height: 10),

              _buildBoldText("Q17: I didn't receive a confirmation email. What should I do?"),
              _buildNormalText(
                  "A: Check your spam folder. If you still can't find it, contact customer support for assistance."),
              SizedBox(height: 10),

              _buildBoldText("Offline Use and Language Support"),
              _buildBoldText("Q18: Can I use HalalGuide offline?"),
              _buildNormalText(
                  "A: Yes, you can use the app offline, but it will not show you spots in your vicinity without an internet connection."),
              SizedBox(height: 10),

              _buildBoldText("Q19: What languages does HalalGuide support?"),
              _buildNormalText(
                  "A: Currently, HalalGuide supports only English. We plan to add more languages in future updates."),
              SizedBox(height: 10),

              _buildBoldText("Contact Us"),
              _buildNormalText(
                  "Q20: How can I contact customer support?\n"
                      "A: You can contact customer support by emailing us at info@halalguide.io."),
            ],
          ),
        ),
      ),
    );
  }

  // Function for bold text
  Widget _buildBoldText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Color(0xFF252525),
      ),
      textAlign: TextAlign.justify,
    );
  }

  // Function for normal text
  Widget _buildNormalText(String text) {
    return Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: Color(0xFF252525),
        ),
        textAlign: TextAlign.justify,
        );
    }
}