import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Addbranch extends StatefulWidget {
  const Addbranch({Key? key}) : super(key: key);

  @override
  _AddbranchState createState() => _AddbranchState();
}

class _AddbranchState extends State<Addbranch> {
  final TextEditingController _menuNameController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  List<String> tags = ['Indian', 'Street food', 'Cafe'];
  String? fileName; // Store the full file path
  String? selectedCurrency = 'DKK (Kr.)'; // Default currency
  String? selectedStatus = 'Inactive'; // Default status
  String? selectedMenu; // Selected menu option
  String? selectedCat = 'category1'; // Default status
  String? selectedIngredient;

  final List<String> features = ['f1', 'f2', 'f3', 'f4'];
  final Map<String, String> dayStatus = {
    'Monday': 'Open',
    'Tuesday': 'Open',
    'Wednesday': 'Open',
    'Thursday': 'Open',
    'Friday': 'Open',
    'Saturday': 'Open',
    'Sunday': 'Open',
  };

  final List<String> cat = ['category1', 'category2'];

  Future<void> _chooseFile() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          // Store the full path of the selected file
          fileName = result.files.single.path;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No file selected')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied')),
      );
    }
  }

  String _selectedShowHideOption = 'Show'; // Default value

  Widget _buildShowHideMenuDropdown() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.2),
          width: 0.5,
        ),
      ),
      child: DropdownButton<String>(
        value: _selectedShowHideOption,
        hint: const Text('Select Show/Hide Menu'),
        isExpanded: true,
        items: <String>['Show', 'Hide'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedShowHideOption = newValue!;
          });
        },
        underline: const SizedBox(), // Remove underline
      ),
    );
  }

  String _selectedDeliveryOption = 'No'; // Default value

  Widget _buildRecipeDeliveryDropdown() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.2),
          width: 0.5,
        ),
      ),
      child: DropdownButton<String>(
        value: _selectedDeliveryOption,
        hint: const Text('Select Delivery Option'),
        isExpanded: true,
        items: <String>['Yes', 'No'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedDeliveryOption = newValue!;
          });
        },
        underline: const SizedBox(), // Remove underline
      ),
    );
  }

  Widget _buildFeatureDropdown() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border:
        Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
      ),
      child: DropdownButton<String>(
        value: selectedMenu,
        hint: const Text('Select Feature'),
        isExpanded: true,
        items: features.map((String feat) {
          return DropdownMenuItem<String>(
            value: feat,
            child: Text(feat),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedMenu = newValue;
          });
        },
        underline: const SizedBox(),
      ),
    );
  }

  Widget _buildCatDropdown() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border:
        Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
      ),
      child: DropdownButton<String>(
        value: selectedMenu,
        hint: const Text('Select category'),
        isExpanded: true,
        items: cat.map((String cato) {
          return DropdownMenuItem<String>(
            value: cato,
            child: Text(cato),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedMenu = newValue;
          });
        },
        underline: const SizedBox(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Branch',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              color: Colors.white,
              child: Card(
                color: const Color(0xFFE3F5E4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLabel('Category'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: _buildCatDropdown(), //ths wont work man
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _buildLabel('Name'),
                      const SizedBox(height: 6),
                      _buildTextField(
                          controller: _menuNameController,
                          hintText: 'Name',
                          iconData: Icons.person),
                      const SizedBox(height: 6),
                      _buildLabel('Contact Number'),
                      const SizedBox(height: 6),
                      _buildTextField(
                          controller: _menuNameController,
                          hintText: 'Contact Number',
                          iconData: Icons.phone),
                      const SizedBox(height: 6),
                      _buildLabel('Email'),
                      const SizedBox(height: 6),
                      _buildTextField(
                          controller: _menuNameController,
                          hintText: 'Email',
                          iconData: Icons.mail),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              color: Colors.white,
              child: Card(
                color: const Color(0xFFE3F5E4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLabel('Location'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Location',
                        iconData: Icons.location_on,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('Latitude'),
                                const SizedBox(height: 6),
                                _buildTextField(
                                  controller: _menuNameController,
                                  hintText: 'Latitude',
                                  iconData: FontAwesomeIcons.globe,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('longitude'),
                                const SizedBox(height: 6),
                                _buildTextField(
                                  controller: _menuNameController,
                                  hintText: 'Longitude',
                                  iconData: FontAwesomeIcons.globe,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('City'),
                                const SizedBox(height: 6),
                                _buildTextField(
                                  controller: _menuNameController,
                                  hintText: 'City',
                                  iconData: Icons.location_city,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('postal Code'),
                                const SizedBox(height: 6),
                                _buildTextField(
                                  controller: _menuNameController,
                                  hintText: 'Postal code',
                                  iconData: FontAwesomeIcons.voicemail,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('State'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'State',
                        iconData: FontAwesomeIcons.city,
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('Country'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Country',
                        iconData: FontAwesomeIcons.mapLocation,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              color: Colors.white,
              child: Card(
                color: const Color(0xFFE3F5E4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.05),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    _buildLabel('Restaurant logo'),
                    const SizedBox(height: 6),
                    _buildFilePicker(),
                    const SizedBox(height: 6),
                    _buildActionButtons(),
                    _buildLabel('Certificate Document'),
                    const SizedBox(height: 6),
                    _buildFilePicker(),
                    const SizedBox(height: 6),
                    _buildActionButtons(),
                    _buildLabel('Image'),
                    const SizedBox(height: 6),
                    _buildFilePicker(),
                    const SizedBox(height: 6),
                    _buildActionButtons(),
                  ]),
                ),
              ),
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              color: Colors.white,
              child: Card(
                color: const Color(0xFFE3F5E4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.05),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    _buildLabel('Halal Percentage'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _menuNameController,
                      hintText: 'Halal Percentage',
                      iconData: FontAwesomeIcons.percent,
                    ),
                    const SizedBox(height: 6),
                    _buildLabel('status'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _menuNameController,
                      hintText: 'Status',
                    ),
                    const SizedBox(height: 6),
                    _buildLabel('Subscription '),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _menuNameController,
                      hintText: 'Subscription',
                    ),
                    const SizedBox(height: 6),
                    _buildLabel('halal Status'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _menuNameController,
                      hintText: 'Halal status',
                    ),
                    const SizedBox(height: 6),
                    _buildLabel('halal Status'),
                    const SizedBox(height: 6),
                    _buildRecipeDeliveryDropdown(),
                    const SizedBox(height: 6),
                    _buildLabel('Delivery link'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _menuNameController,
                      hintText: 'Halal Percentage',
                      iconData: FontAwesomeIcons.link,
                    ),
                    const SizedBox(height: 6),
                    _buildLabel('Show Hide Menu'),
                    const SizedBox(height: 6),
                    _buildShowHideMenuDropdown(),
                    const SizedBox(height: 6),
                    _buildLabel('Description'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _menuNameController,
                      hintText: 'Description',
                      maxLines: 6,
                    ),
                    const SizedBox(height: 6),
                    _buildLabel('Exploratory Message'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _menuNameController,
                      hintText: 'Message',
                      maxLines: 4,
                    ),
                    const SizedBox(height: 6),
                    _buildLabel('Restaurent Tags'),
                    Container(
                      width: 360,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 0.5, color: Colors.black.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: tags.map((tag) => _buildTag(tag)).toList(),
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildLabel('Restaurent Tags'),
                    _buildFeatureDropdown(),
                  ]),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              color: Colors.white,
              child: Stack(
                children: [
                  Card(
                    color: const Color(0xFFE3F5E4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.02),
                      child: Column(
                        children: [
                          // Header Row
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(3.8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Day',
                                      style: TextStyle(
                                        fontSize: 7.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Open',
                                      style: TextStyle(
                                        fontSize: 7.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Close',
                                      style: TextStyle(
                                        fontSize: 7.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Status',
                                      style: TextStyle(
                                        fontSize: 7.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 0.5, color: Colors.black.withOpacity(0.2)),

                          // Table Rows
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                ...[
                                  'Monday',
                                  'Tuesday',
                                  'Wednesday',
                                  'Thursday',
                                  'Friday',
                                  'Saturday',
                                  'Sunday'
                                ].map((day) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFE3F5E4),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.circular(3.8),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 12.0), // Increased row height
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Day Column
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    day,
                                                    style: TextStyle(fontSize: 7),
                                                  ),
                                                ),
                                              ),

                                              // Open Time Column
                                              Expanded(
                                                child: Container(
                                                  height: 30.0, // Adjusted height for proper vertical centering
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  child: Center(
                                                    // Center the TextField vertically
                                                    child: TextField(
                                                      controller: TextEditingController(text: '08:00'),
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        contentPadding: EdgeInsets.symmetric(vertical: 0), // No extra padding
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 7.0),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              // Close Time Column
                                              Expanded(
                                                child: Container(
                                                  height: 30.0, // Adjusted height for proper vertical centering
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  child: Center(
                                                    // Center the TextField vertically
                                                    child: TextField(
                                                      controller: TextEditingController(text: '10:00'),
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        contentPadding: EdgeInsets.symmetric(vertical: 0), // No extra padding
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontSize: 7.0),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              // Status Column
                                              Expanded(
                                                child: Container(
                                                  height: 30.0, // Adjusted height for proper vertical centering
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                                                  child: Center(
                                                    // Centering the dropdown inside the box
                                                    child: DropdownButton<String>(
                                                      value: dayStatus[day],
                                                      items: ['Open', 'Close'].map((status) {
                                                        return DropdownMenuItem(
                                                          value: status,
                                                          child: Text(status, style: TextStyle(fontSize: 7.0)),
                                                        );
                                                      }).toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          dayStatus[day] = value!;
                                                        });
                                                      },
                                                      iconSize: 10,
                                                      underline: SizedBox(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(height: 0.5, color: Colors.black.withOpacity(0.2)),
                                      ],

                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 10), // Adds spacing from the table
                            child: Container(
                              width: 90,
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                              decoration: ShapeDecoration(
                                color: Color(0xFF47A851),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Center(
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),



                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Row(
      children: [
        Text(text,
            style: const TextStyle(fontSize: 14, color: Color(0xFF000000))),
        const Text('*', style: TextStyle(fontSize: 14, color: Colors.red)),
      ],
    );
  }

  Widget _buildFilePicker() {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFE3DFDF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: TextButton(
                onPressed: _chooseFile,
                child: Text(
                  fileName ?? 'Choose File',
                  style:
                  const TextStyle(fontSize: 14, color: Color(0xFF888888)),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: const Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.upload_file, color: Color(0xFF3565CD)),
                onPressed: _chooseFile,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            if (fileName != null) {
              // Ensure a file is selected before showing the image
              _showImageDialog();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No image selected')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF47A851),
            minimumSize: const Size(130, 30),
            padding: const EdgeInsets.symmetric(vertical: 8),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text(
            'View Image',
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  void _showImageDialog() {
    if (fileName != null) {
      // Check if fileName is not null before displaying the image
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Stack(
              children: [
                Image.file(File(fileName!),
                    fit: BoxFit.cover), // Display the selected image
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }

  Widget _buildTag(String tag) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: Color(0xFFDED9DA),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.5, color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tag,
            style: TextStyle(
              color: Color(0xFF252525),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () {
              setState(() {
                tags.remove(tag);
              });
            },
            child: Icon(Icons.close, size: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

Widget _buildTextField({
  required TextEditingController controller,
  required String hintText,
  IconData? iconData, // This should be IconData instead of Icon
  Color? iconColor, // This is optional for icon color
  int maxLines = 1,
}) {
  return Container(
    height: maxLines == 1 ? 40 : null,
    // Apply fixed height only for single-line fields
    child: TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF888888),
          fontFamily: 'Roboto',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.0,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 0.5,
          ),
        ),
        prefixIcon: iconData != null
            ? Icon(
          iconData,
          color: iconColor ?? Color(0xFF888888), // Use the provided color or default to Color(0xFF888888)
          size: 18.0, // Adjust the size as needed
        )
            : null,
      ),
    ),
  );
}