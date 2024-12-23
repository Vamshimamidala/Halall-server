import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: 360, // Fixed width as per the requirement
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Privacy Policy"),
              _buildNormalText(
                  "This privacy policy applies to the HalalGuide app (hereinafter referred to as \"Application\") for mobile devices, which was developed by HalalGuide (hereinafter referred to as \"Service Provider\") as a Freemium service. This service is provided \"AS IS\"."),
              SizedBox(height: 10),
              _buildSectionTitle(
                  "What information does the Application obtain and how is it used?"),
              _buildBoldedText("User Provided Information"),
              _buildNormalText(
                  "The Application acquires the information you supply when you download and register the Application. Registration with the Service Provider is not mandatory. However, please note that some features of the Application, such as submitting reviews, using the scanner function, or customizing ingredient classifications, may not be accessible unless you register with us."),
              _buildNormalText(
                  "The Service Provider may also use the information you provide to contact you occasionally with important information, required notices, and marketing promotions."),
              SizedBox(height: 10),
              _buildBoldedText("Automatically Collected Information"),
              _buildNormalText(
                  "In addition, the Application may collect certain information automatically, including, but not limited to, the type of mobile device you use, your mobile device’s unique device ID, the IP address of your mobile device, your mobile operating system, the type of mobile internet browsers you use, and information about how you use the Application."),
              SizedBox(height: 10),
              _buildBoldedText(
                  "Does the Application collect precise real-time location information of the device?"),
              _buildNormalText(
                  "This Application collects your device's location to help the Service Provider determine your approximate geographical location and make use of it in the following ways:"),
              _buildBoldedText("Geolocation Services:"),
              _buildNormalText(
                  "The Service Provider utilizes location data to provide features such as personalized content, relevant recommendations, and location-based services."),
              _buildBoldedText("Analytics and Improvements:"),
              _buildNormalText(
                  "Aggregated and anonymized location data helps the Service Provider analyze user behavior, identify trends, and improve the overall performance and functionality of the Application."),
              _buildBoldedText("Third-Party Services:"),
              _buildNormalText(
                  "Periodically, the Service Provider may transmit anonymized location data to external services to enhance the Application and optimize their offerings."),
              SizedBox(height: 10),
              _buildSectionTitle("How is information about restaurants and business spots managed?"),
              _buildNormalText(
                  "The Application provides information about various halal business spots, including restaurants, cafés, mosques, and more. This information is provided by the businesses themselves, and while the Service Provider strives to ensure accuracy, HalalGuide is not responsible for any incorrect information, such as misclassification of halal status. The Service Provider will update any incorrect information upon discovery."),
              _buildSectionTitle("How does the scanner function and ingredient classification work?"),
              _buildNormalText(
                  "The Application includes a scanner function that allows users to scan product barcodes to view ingredients, daily values, and other product details. Ingredients are categorized by the Service Provider as halal, mushbooh, or haram based on our understanding. Users can customize these classifications according to their beliefs on their profiles. The Service Provider is not responsible for any errors in ingredient data or user-modified classifications. It is the user's responsibility to verify the accuracy of ingredient information based on their own dietary requirements."),
              _buildSectionTitle("User Profiles and Reviews"),
              _buildNormalText(
                  "The Application allows users to create profiles, submit reviews, and rate businesses. Information provided in user profiles, such as usernames, reviews, and ratings, may be publicly accessible within the Application. Users are responsible for the content they share and should ensure it complies with our Terms and Conditions."),
              _buildSectionTitle("Do third parties see and/or have access to information obtained by the Application?"),
              _buildNormalText(
                  "Only aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties as described in this privacy policy. Please note that the Application utilizes third-party services that have their own Privacy Policies regarding the handling of data. Below are the links to the Privacy Policies of the third-party service providers used by the Application:"),
              _buildNormalText(
                  "Google Play Services\nGoogle Analytics for Firebase\nFirebase Crashlytics\nFacebook\nThe Service Provider may disclose User Provided and Automatically Collected Information: as required by law, such as to comply with a subpoena or similar legal process. when they believe in good faith that disclosure is necessary to protect their rights, protect your safety or the safety of others, investigate fraud, or respond to a government request. to their trusted service providers who work on their behalf, do not have an independent use of the information disclosed to them, and have agreed to adhere to the rules set forth in this privacy policy."),
              _buildSectionTitle("What are my opt-out rights?"),
              _buildNormalText(
                  "You can stop all collection of information by the Application easily by uninstalling the Application. You may use the standard uninstall processes available as part of your mobile device or via the mobile application marketplace or network."),
              _buildSectionTitle("Data Retention Policy, Managing Your Information"),
              _buildNormalText(
                  "The Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. The Service Provider will retain Automatically Collected information for up to 24 months and may thereafter store it in aggregate form. If you'd like the Service Provider to delete User Provided Data that you have provided via the Application, please contact them at info@halalguide.io, and they will respond within a reasonable time. Please note that some or all of the User Provided Data may be required for the Application to function properly."),
              _buildSectionTitle("Children"),
              _buildNormalText(
                  "The Service Provider does not knowingly collect personally identifiable information from children under the age of 13. If the Service Provider becomes aware that a child under 13 has provided personal information, they will immediately delete this from their servers. If you are a parent or guardian and you are aware that your child has provided personal information, please contact the Service Provider at info@halalguide.io so that they can take the necessary actions."),
              _buildSectionTitle("Security"),
              _buildNormalText(
                  "The Service Provider is concerned about safeguarding the confidentiality of your information. They provide physical, electronic, and procedural safeguards to protect information they process and maintain. For example, they limit access to this information to authorized employees and contractors who need to know that information in order to operate, develop, or improve the Application. Please be aware that, although they endeavor to provide reasonable security for information they process and maintain, no security system can prevent all potential security breaches."),
              _buildSectionTitle("Changes"),
              _buildNormalText(
                  "This Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes. This privacy policy is effective as of 2024-09-01."),
              _buildSectionTitle("Your Consent"),
              _buildNormalText(
                  "By using the Application, you consent to the Service Provider processing your information as set forth in this Privacy Policy now and as amended by us. \"Processing\" means using cookies on a computer/handheld device or using or handling information in any way, including, but not limited to, collecting, storing, deleting, using, combining, and disclosing information."),
              _buildSectionTitle("Contact Us"),
              _buildNormalText(
                  "If you have any questions regarding privacy while using the Application or have questions about our practices, please contact the Service Provider via email at info@halalguide.io."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: Color(0xFF252525),
        height: 1.5, // Adjust line height for readability
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildBoldedText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: Color(0xFF252525),
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildNormalText(String text) {
    return Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Color(0xFF252525),
        ),
        textAlign: TextAlign.justify,
        );
    }
}