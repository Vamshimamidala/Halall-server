import 'dart:io'; // Required for Platform check
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PlatformSpecificDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? _buildIOSDrawer(context)
          : _buildAndroidDrawer(context),
    );
  }

  Widget _buildAndroidDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04,
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Image(image: AssetImage('lib/assets/Hglogo.png')),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Close the drawer
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4C8435),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildAndroidListTile(
              context,
              FontAwesomeIcons.tachometer,
              "Dashboard",
              "/dashbord",
            ),
            _buildDivider(),
            _buildAndroidListTile(
              context,
              Icons.menu,
              "Manage Menu",
              "/menu",
            ),
            _buildDivider(),
            _buildAndroidListTile(
              context,
              Icons.shopping_cart,
              "Manage Products",
              "/product",
            ),
            _buildDivider(),
            _buildAndroidListTile(
              context,
              FontAwesomeIcons.utensils,
              "Manage Restaurant",
              "/managerestro",
            ),
            _buildDivider(),
            _buildAndroidListTile(
              context,
              FontAwesomeIcons.codeBranch,
              "Manage Branches",
              "/managebranch",
            ),
            _buildDivider(),
            _buildAndroidListTile(
              context,
              FontAwesomeIcons.wifi,
              "Restaurant Features",
              "/managefeature",
            ),
            _buildDivider(),
            _buildAndroidListTile(
              context,
              FontAwesomeIcons.solidStar,
              "Ratings & Reviews",
              "/review",
            ),
            _buildDivider(),
            _buildAndroidListTile(
              context,
              FontAwesomeIcons.solidBell,
              "Notifications",
              "/notifications",
            ),
            _buildDivider(),
            _buildAndroidListTile(
              context,
              FontAwesomeIcons.key,
              "Change Password",
              "/changepass",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIOSDrawer(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Dashboard'),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: ListView(
            children: [
              _buildIOSListTile(context, "Dashboard",  "/dashbord"),
              Divider(height: 0.5, color: Color(0x8C808080), ),
              _buildIOSListTile(context, "Manage Menu",  "/menu"),
              Divider(height: 0.5, color: Color(0x8C808080), ),
              _buildIOSListTile(context, "Manage Products","/product"),
              Divider(height: 0.5, color: Color(0x8C808080), ),
              _buildIOSListTile(context, "Manage Restaurant",  "/managerestro"),
              Divider(height: 0.5, color: Color(0x8C808080), ),
              _buildIOSListTile(context, "Manage Branches",  "/managebranch"),
              Divider(height: 0.5, color: Color(0x8C808080), ),
              _buildIOSListTile(context, "Restaurant Features", "/managefeature"),
              Divider(height: 0.5, color: Color(0x8C808080), ),
              _buildIOSListTile(context, "Ratings & Reviews",  "/review"),
              Divider(height: 0.5, color: Color(0x8C808080), ),
              _buildIOSListTile(context, "Notifications",  "/notifications"),
              Divider(height: 0.5, color: Color(0x8C808080), ),
              _buildIOSListTile(context, "Change Password", "/changepass"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAndroidListTile(
      BuildContext context,
      IconData icon,
      String title,
      String route,
      ) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF4C8435)),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF000000),
          fontFamily: 'Roboto',
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          height: 1.0,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _buildIOSListTile(BuildContext context, String title, String route) {
    return CupertinoListTile(

      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }


  Widget _buildDivider() {
    return const Divider(
      color: Color.fromRGBO(0, 0, 0, 0.20),
      thickness: 1.0,
      indent: 16.0,
      endIndent: 16.0,
      height: 1,
    );
  }
}