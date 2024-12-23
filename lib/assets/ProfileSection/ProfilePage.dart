import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _profilePicUrl = 'lib/assets/dashbordimage/Ellipse.svg'; // Placeholder default profile picture
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _accountController.text = 'info@foodiesadd.com';
    _displayNameController.text = 'FoodiesAdda';
    _passwordController.text = '********';
  }

  void _saveProfile() {
    print('Account: ${_accountController.text}');
    print('Display Name: ${_displayNameController.text}');
    print('Password: ${_passwordController.text}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully')),
    );
  }

  void _editField(String field, TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter your $field'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _editProfilePic() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: 380,
            height: 188,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  color: Colors.black.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 13,
                  top: 17,
                  child: SizedBox(
                    width: 168,
                    child: Text(
                      'Change Profile Photo',
                      style: TextStyle(
                        color: Color(0xFF252525),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 13,
                  top: 68,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: _viewPhoto,
                        child: Text(
                          'View Photo',
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          _pickImage();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Choose Photo',
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _viewPhoto() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 200,
            height: 200,
            child: _selectedImage != null
                ? Image.file(_selectedImage!)
                : SvgPicture.asset(_profilePicUrl), // Display SVG image
          ),
        );
      },
    );
  }



  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    title: Text('Profile Picture', style: TextStyle(fontSize: 14)),
                    subtitle: _selectedImage != null
                        ? Image.file(
                      _selectedImage!,
                      width: 10,
                      height: 10,
                      fit: BoxFit.cover,
                    )
                        : SvgPicture.asset(
                      _profilePicUrl,
                      width: 10,
                      height: 10,
                      fit: BoxFit.cover,
                    ),


                    onTap: _editProfilePic,
                  ),
                  Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    title: Text('Account', style: TextStyle(fontSize: 14)),
                    subtitle: Text(_accountController.text, style: TextStyle(fontSize: 14)),
                    onTap: () => _editField('Account', _accountController),
                  ),
                  Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    title: Text('Display Name', style: TextStyle(fontSize: 14)),
                    subtitle: Text(_displayNameController.text, style: TextStyle(fontSize: 14)),
                    onTap: () => _editField('Display Name', _displayNameController),
                  ),
                  Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    title: Text('Password', style: TextStyle(fontSize: 14)),
                    subtitle: Text(_passwordController.text, style: TextStyle(fontSize: 14)),
                    onTap: () => _editField('Password', _passwordController),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10.0),

              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('About Us', style: TextStyle(fontSize: 14)),
                    leading: Icon(Icons.info_outline),
                    onTap: () {
                      Navigator.pushNamed(context, '/aboutus');
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Terms & Conditions', style: TextStyle(fontSize: 14)),
                    leading: Icon(Icons.description_outlined),
                    onTap: () {
                      print('Signing out...');
                      Navigator.pushNamed(context, '/termsandconditions');
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Privacy Policy', style: TextStyle(fontSize: 14)),
                    leading: Icon(Icons.lock_outline),
                    onTap: () {
                      print('Signing out...');
                      Navigator.pushNamed(context, '/privacy');
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Contact Us', style: TextStyle(fontSize: 14)),
                    leading: Icon(Icons.contact_mail_outlined),
                    onTap: () {
                      print('Signing out...');
                      Navigator.pushNamed(context, '/contactus');
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('FAQs', style: TextStyle(fontSize: 14)),
                    leading: Icon(Icons.help_outline),
                    onTap: () {
                      print('Signing out...');
                      Navigator.pushNamed(context, '/faq');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Switch Account', style: TextStyle(fontSize: 14)),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    onTap: () {
                      print('Signing out...');
                      Navigator.pushReplacementNamed(context, '/welcomescreen');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}