import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWidth < 400 ? screenWidth * 0.9 : 380,
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Color(0xFFE8F5E9), // Light green background for the entire container
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gradientHeader('Our Story'),
                const SizedBox(height: 15),

                // About Us Section
                customSection(
                  title: 'About Us',
                  content:
                  'Welcome to HalalGuide, your ultimate resource for finding halal business spots and products worldwide. Our app is designed to help you discover a variety of halal-friendly spots, including restaurants, cafés, candy shops, butchers, supermarkets, and much more. Whether youre searching for a place to eat, shop for groceries, or find halal cosmetics and personal care products, HalalGuide is here to assist you.',
                ),
                const SizedBox(height: 20),

                // Our Mission Section
                customSection(
                  title: 'Our Mission',
                  content:
                  'At HalalGuide, our mission is to make halal-certified options easily accessible across various sectors. We recognize the significance of halal compliance and are committed to providing a trustworthy and user-friendly platform for our users. Our goal is to bridge the gap between consumers and businesses, ensuring you can make informed choices that align with your dietary and lifestyle preferences.',
                ),
                const SizedBox(height: 20),

                // Key Features Header
                gradientHeader('Key Features'),
                const SizedBox(height: 15),

                // All Key Features in One Container
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      featurePoint('• Business Directory: Explore a vast array of halal business spots, including restaurants, cafés, butchers, candy shops, supermarkets, and more. Each listing includes detailed information to help you make the best choice for your needs.'),
                      featurePoint('• Scanner Function: Use our scanner feature to scan barcodes on products and instantly view their ingredients and halal status. This tool is perfect for ensuring that the products you purchase meet your dietary requirements.'),
                      featurePoint('• User Reviews and Ratings: Read reviews and ratings from other users to find the best halal options in your area. Share your own experiences to help the community make informed decisions.'),
                      featurePoint('• Offers and Discounts: Stay updated with the latest deals and discounts from halal business spots, helping you save while you shop.'),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                gradientHeader('Why Choose Us?'),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      featurePoint('• Comprehensive Listings: Our extensive database includes a wide variety of halal business spots and products, ensuring you have access to a broad range of halal options.'),
                      featurePoint('• User-Friendly Interface: Designed with you in mind, our app is intuitive and easy to navigate, making it simple to find exactly what you\'re looking for.'),
                      featurePoint('• Community-Driven: Join a growing community of users dedicated to supporting and promoting halal business spots. Your feedback and contributions help us improve and expand our offerings.'),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  // Gradient header widget with specific styling
  Widget gradientHeader(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF47A851), Color(0xFF1C4220)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Custom Section for About Us, Mission, and Features (with rounded background)
  Widget customSection({required String title, required String content}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            SizedBox(
              width: 348,
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF252525),
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 1.2,  // Adjust line height for title
                ),
              ),
            ),
          const SizedBox(height: 8),  // Adjusted height between title and content
          SizedBox(
            width: 348,
            child: Text(
              content,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,  // Adjust font size for better text fitting
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 1.4,  // Adjusted line height
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for feature points inside the Key Features section
  Widget featurePoint(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        content,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,  // Smaller font size for feature points
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: 1.4,  // Adjusted line height for compactness
        ),
      ),
    );
  }
}