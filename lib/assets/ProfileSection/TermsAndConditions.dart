import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Conditions',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white, // Change app bar background color if needed
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Effective Date: 2024-09-01',
                content:
                'These terms and conditions apply to the HalalGuide app (hereinafter referred to as "Application") for mobile devices that was created by HalalGuide (hereinafter referred to as "Service Provider") as a Freemium service.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '1. Use of the Application:',
                content:
                'HalalGuide is designed to help users find halal spots around the world, including restaurants, cafés, candy shops, butchers, supermarkets, and many more categories. Restaurants and businesses have profiles that may include their logo, photos, name, address, phone number, email, delivery options, business hours, and ratings/reviews.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: 'Categorization of Restaurants:',
                content:
                'Green Halal Tag: The restaurant offers 100% halal food, and no alcohol is served.\n'
                    'Yellow Halal Tag: All food is halal, but alcohol is served.\n'
                    'Red Halal Tag: Halal food is served alongside non-halal food, and alcohol is served.\n\n'
                    'Disclaimer: The Service Provider does not take responsibility for the accuracy of the information provided by the restaurants, including their self-categorization. If a restaurant has been incorrectly categorized, the Service Provider will update the information in the Application as soon as they become aware of the discrepancy.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '2. Product and Ingredient Scanner:',
                content:
                'The Application provides a scanner function that allows users to scan products using their barcode. The Application will display the product\'s ingredients, nutritional information, and more.\n\n'
                    'Ingredient Classification: Ingredients are categorized by the Service Provider as halal, mushbooh, or haram based on their understanding. Users can customize these classifications according to their beliefs on their profiles.\n\n'
                    'Allergy Warnings: Users can mark certain ingredients as allergens. The Application will alert them if a scanned product contains an ingredient they have marked as an allergen.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '3. Offers and Discounts:',
                content:
                'The Service Provider may offer promotions, discounts, or other deals through the Application. These offers are subject to availability and terms specified by the participating businesses. The Service Provider is not responsible for any disputes arising from the redemption of these offers.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '4. User-Generated Content:',
                content:
                'The Application allows users to submit reviews, ratings, and other content. By submitting content, you grant the Service Provider a non-exclusive, worldwide, royalty-free license to use, display, and distribute this content within the Application. The Service Provider reserves the right to remove or modify any user-generated content that is deemed inappropriate, misleading, or in violation of these terms.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '5. Business Listings:',
                content:
                'While the Service Provider strives to maintain accurate and up-to-date business information, it cannot guarantee the completeness or accuracy of the listings. Businesses are responsible for ensuring their information is correct. Users are encouraged to verify the details independently before making any decisions based on the listings.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '6. Application Modifications:',
                content:
                'The Service Provider is dedicated to ensuring that the Application is as beneficial and efficient as possible. As such, they reserve the right to modify the Application or charge for their services at any time and for any reason. The Service Provider assures you that any charges for the Application or its services will be clearly communicated to you.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '7. Personal Data and Security:',
                content:
                'The Application stores and processes personal data that you have provided to the Service Provider in order to provide the Service. It is your responsibility to maintain the security of your phone and access to the Application. The Service Provider strongly advises against jailbreaking or rooting your phone, as this could expose your phone to malware, viruses, malicious programs, compromise your phone\'s security features, and may result in the Application not functioning correctly or at all.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '8. Third-Party Services:',
                content:
                'The Application utilizes third-party services that have their own Terms and Conditions. Below are the links to the Terms and Conditions of the third-party service providers used by the Application:\n\n'
                    'Google Play Services\n'
                    'Google Analytics for Firebase\n'
                    'Firebase Crashlytics\n'
                    'Facebook',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '9. Limitation of Liability:',
                content:
                'Please be aware that the Service Provider does not assume responsibility for certain aspects. Some functions of the Application require an active internet connection, which can be Wi-Fi or provided by your mobile network provider. The Service Provider cannot be held responsible if the Application does not function at full capacity due to lack of access to Wi-Fi or if you have exhausted your data allowance.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '10. Updates to the Application:',
                content:
                'The Service Provider may wish to update the Application at some point. The Application is currently available as per the requirements for the operating system (and for any additional systems they decide to extend the availability of the Application to). Operating system requirements may change, and you will need to download the updates if you want to continue using the Application. The Service Provider does not guarantee that it will always update the Application so that it is relevant to you and/or compatible with the particular operating system version installed on your device.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '11. Changes to These Terms and Conditions:',
                content:
                'The Service Provider may periodically update these Terms and Conditions. Therefore, you are advised to review this page regularly for any changes. The Service Provider will notify you of any changes by posting the new Terms and Conditions on this page. These terms and conditions are effective as of 2024-09-01.',
              ),
              SizedBox(height: 10),
              _buildSection(
                title: '12. Contact Us:',
                content:
                'If you have any questions or suggestions about the Terms and Conditions, please do not hesitate to contact the Service Provider at info@halalguide.io.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    List<String> titleParts = title.split(':');
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 10,
          color: Color(0xFF252525),
          height: 1.5,
        ),
        children: [
          TextSpan(
            text: titleParts[0],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          if (titleParts.length > 1)
            TextSpan(
              text: ': ${titleParts.sublist(1).join(":")}\n\n',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          TextSpan(
            text: content,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}