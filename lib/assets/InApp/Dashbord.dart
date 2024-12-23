import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io'; // To detect platform
import 'package:flutter/cupertino.dart';

import 'package:halal_app/assets/InApp/Drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Function to handle BottomNavigationBar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate based on the selected index
    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, '/dashbord'); // Replace '/home' with your route for Home
        break;
      case 1:
        Navigator.pushNamed(context, '/managerestro'); // Replace '/restaurants' with your route for Restaurants
        break;
      case 2:
        Navigator.pushNamed(context, '/product'); // Replace '/products' with your route for Products
        break;
      case 3:
        Navigator.pushNamed(context, '/managebranch'); // Replace '/branches' with your route for Branches
        break;
      case 4:
        Navigator.pushNamed(context, '/notifications'); // Replace '/notifications' with your route for Notifications
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(60), // Adjust the size of the AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // AppBar background color (remains unchanged)
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: AppBar(
            elevation: 0, // Set elevation to 0 to prevent color change
            leading: IconButton(
              icon: const Icon(Icons.menu), // Hamburger Menu
              onPressed: () {
                _scaffoldKey.currentState
                    ?.openDrawer(); // Add drawer or menu functionality here
              },
            ),
            title: Image.asset(
              'lib/assets/Hglogo.png', // Center logo
              height: 50,
              width: 50,
            ),
            centerTitle: true,
            actions: [Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profilepage');
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(
                        'lib/assets/dashbordimage/Ellipse.svg'), // Profile Picture
                  ),
                ),
                const SizedBox(width: 15),
              ],
            )
            ],
            backgroundColor: Colors.transparent, // Keep AppBar transparent
          ),
        ),
      ),
      drawer: PlatformSpecificDrawer(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Welcome!!',
                  style: TextStyle(
                    color: const Color(0xFF252525), // Equivalent to #252525 in hex
                    fontFamily: Platform.isIOS ? 'SFProDisplay' : 'Roboto', // Apply SF-Pro-Display on iOS
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600, // Semi-bold
                    height: 1.0, // Equivalent to line-height: normal
                  ),
                ),
              ),
              // Three buttons covering 3/5 of the page
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDashboardButton(
                      title: 'Menu',
                      subtitle: '20', // Placeholder for number of menus
                      image:
                          'lib/assets/dashbordimage/pana.jpg', // Custom image for Menu
                      lineColor: const Color(0xFFD99A29),
                      // Custom color for the left line
                      boxColor: const Color(0xFFFFFAF1),
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/menu');
                      },
                    ),
                    _buildDashboardButton(
                      title: 'Products',
                      subtitle: '50', // Placeholder for number of products
                      image:
                          'lib/assets/dashbordimage/cuate.jpg', // Custom image for Products
                      lineColor: const Color(0xFF198754),
                      // Custom color for the left line
                      boxColor: const Color(0xFFEEFFF7),
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/product');
                      },
                    ),
                    _buildDashboardButton(
                      title: 'Average Rating',
                      subtitle: '4.5', // Placeholder for rating
                      image:
                          'lib/assets/dashbordimage/c2.jpg', // Custom image for Rating
                      lineColor: const Color(0xFF6200EA),
                      // Custom color for the left line
                      boxColor: const Color(0xFFF8F3FF),
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/review');
                      },
                    ),
                  ],
                ),
              ),
              // Spacer covering 2/5 of the page
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Platform.isIOS ? CupertinoIcons.line_horizontal_3: Icons.menu, // Use Cupertino icon for iOS
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Platform.isIOS ? FontAwesomeIcons.utensils : FontAwesomeIcons.utensils, // Use Cupertino icon for iOS
            ),
            label: 'Restaurants',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Platform.isIOS ? CupertinoIcons.cart : FontAwesomeIcons.cartShopping, // Use Cupertino icon for iOS
            ),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Platform.isIOS ? FontAwesomeIcons.codeBranch : FontAwesomeIcons.codeBranch, // Use Cupertino icon for iOS
            ),
            label: 'Branches',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Platform.isIOS ? CupertinoIcons.bell : Icons.notifications, // Use Cupertino icon for iOS
            ),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex, // Highlight the selected icon
        selectedItemColor: Colors.green, // Custom color for selected item
        unselectedItemColor: Colors.grey, // Custom color for unselected items
        onTap: _onItemTapped, // Update the selected index on tap
      ),
    );
  }

  // Reusable button with image, title, subtitle, and left line
  Widget _buildDashboardButton({
    required String title,
    required String subtitle,
    required String image,
    required Color lineColor,
    required Color boxColor,
    required double screenHeight,
    required double screenWidth,
    required VoidCallback onPressed, // Add this parameter
  }) {
    return GestureDetector(
      onTap: onPressed, // Call the onPressed function
      child: Container(
        height: screenHeight * 0.15,
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
        // Adding margin to the container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          color: boxColor,
          border: Border.all(
            color: Colors.black
                .withOpacity(0.20), // Equivalent to rgba(0, 0, 0, 0.20)
            width: 0.5, // Border width set to 0.5px
          ),
        ),
        child: Row(
          children: [
            // Left colored line
            Container(
              width: 8,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: lineColor,
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            // Add some space between the line and image
            // Image in the center-left
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // Adding padding around the image
              child: Image.asset(
                width: screenWidth * 0.4,
                image,
              ),
            ),
            SizedBox(width: screenWidth * 0.14),
            // Add some space between the image and text
            // Title and subtitle
            Expanded(
              // Prevents overflow by ensuring text takes available space
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}