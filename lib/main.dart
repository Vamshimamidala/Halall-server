import 'package:flutter/material.dart';
import 'package:halal_app/assets/ForgotPassword.dart';
import 'package:halal_app/assets/InApp/AddBranch.dart';
import 'package:halal_app/assets/InApp/AddIngredients.dart';
import 'package:halal_app/assets/InApp/AddMenu.dart';
import 'package:halal_app/assets/InApp/AddProducts.dart';
import 'package:halal_app/assets/InApp/ChangePassword.dart';
import 'package:halal_app/assets/InApp/CreateRestaurant.dart';
import 'package:halal_app/assets/InApp/Dashbord.dart';
import 'package:halal_app/assets/InApp/ManageBranches.dart';
import 'package:halal_app/assets/InApp/ManageFeature.dart';
import 'package:halal_app/assets/InApp/ManageRestaurant.dart';
import 'package:halal_app/assets/InApp/Menu.dart';
import 'package:halal_app/assets/InApp/Product.dart';
import 'package:halal_app/assets/InApp/Review.dart';
import 'package:halal_app/assets/ProfileSection/AboutUs.dart';
import 'package:halal_app/assets/ProfileSection/ContactUs.dart';
import 'package:halal_app/assets/ProfileSection/Faqs.dart';
import 'package:halal_app/assets/ProfileSection/PrivacyPolicy.dart';
import 'package:halal_app/assets/ProfileSection/ProfilePage.dart';
import 'package:halal_app/assets/ProfileSection/TermsAndConditions.dart';
import 'package:halal_app/assets/Register.dart';
import 'package:halal_app/assets/ThankyouRegister.dart';
import 'package:halal_app/assets/InApp/Notifications.dart';
import 'assets/theme.dart';
import 'assets/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      routes:  {
        "/register": (context) => const Register(),
        "/welcomescreen":(context) => const WelcomeScreen(),
        "/forgotpass" :(context) => const ForgotPassword(),
        "/thankyou" :(context) => const Thankyouregister(),
        "/dashbord" :(context) => const Dashboard(),
        "/menu"   :(context) => const Menu(),
        "/product" :(context) => const ManageProductPage(),
        "/review" :(context) => const ReviewPage(),
        "/managebranch" :(context) => const Managebranches(),
        "/managefeature" :(context) => const Managefeature(),
        "/notifications" :(context) => NotificationsPage(),
         "/changepass" :(context) => ChangePasswordPage(),
        "/addmenu"  :(context) => AddMenuPage(),
        "/addproduct":(context) => AddProductPage(),
        "/addingredients":(context) => AddIngredientsPage(),
        "/managerestro" :(context) => ManageRestaurantPage(),
        "/createrestro" :(context) => CreateRestaurantPage(),
        "/addbranch" :(context)  => Addbranch(),
        "/termsandconditions":(context) => TermsAndConditionsPage(),
        "/profilepage" :(context)  => ProfilePage(),
        "/faq" :(context) =>FaqScreen(),
        "/aboutus" :(context) => AboutSection(),
        "/privacy" :(context) => PrivacyPolicyScreen(),
        "/contactus" :(context)=> ContactUsScreen()
      },
      home: const WelcomeScreen(),

    );

  }
}