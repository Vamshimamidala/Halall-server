import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _menuNameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? fileName; // Store the full file path
  String? selectedCurrency = 'DKK (Kr.)'; // Default currency
  String? selectedStatus = 'Inactive'; // Default status
  String? selectedMenu; // Selected menu option
  String? selectedHalalStatus = 'No'; // Default status
  String? selectedIngredient;
  bool _isBestSelling = false; // State variable for the checkbox
  final List<String> currencies = [
    'DKK (Kr.)',
    'EUR (€)',
    'USD (\$)',
    'Rupee (₹)',
    'GBP (£)',
    'PKR (Rs)',
    'SEK (kr)',
    'NOK (kr)',
    'TRY ()',
    'AED',
    'SAR',
  ];
  final List<String> ingredients = [
    'Ingredient 1',
    'Ingredient 2',
    'Ingredient 3',
    'Ingredient 4',
    // Add more ingredients as needed
  ];
  final List<String> status = ['Active', 'Inactive'];
  final List<String> menuOptions = ['Menu 1', 'Menu 2', 'Menu 3'];
  final List<String> HalalStatus = ['Yes', 'No'];

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

  Widget _buildCurrencyDropdown() {
    return Container(
      height: 40,
      padding:EdgeInsets.only(left:10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border:
            Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
      ),
      child: DropdownButton<String>(
        value: selectedCurrency,
        hint: const Text('Select Currency'),
        isExpanded: true,
        items: currencies.map((String currency) {
          return DropdownMenuItem<String>(
            value: currency,
            child: Text(currency),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedCurrency = newValue;
          });
        },
        underline: const SizedBox(),
      ),
    );
  }

  Widget _buildIngredientsDropdown() {
    return Container(
      height: 40,
      padding:EdgeInsets.only(left:10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border:
            Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
      ),
      child: DropdownButton<String>(
        value: selectedIngredient,
        hint: const Text('Select Ingredient'),
        isExpanded: true,
        items: ingredients.map((String ingredient) {
          return DropdownMenuItem<String>(
            value: ingredient,
            child: Text(ingredient),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedIngredient = newValue;
          });
        },
        underline: const SizedBox(),
      ),
    );
  }

  Widget _buildStatusDropdown() {
    return Container(
      height: 40,
      padding:EdgeInsets.only(left:10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border:
            Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
      ),
      child: DropdownButton<String>(
        value: selectedStatus,
        hint: const Text('Select Status'),
        isExpanded: true,
        items: status.map((String statusItem) {
          return DropdownMenuItem<String>(
            value: statusItem,
            child: Text(statusItem),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedStatus = newValue;
          });
        },
        underline: const SizedBox(),
      ),
    );
  }

  Widget _buildMenuDropdown() {
    return Container(
      height: 40,
      padding:EdgeInsets.only(left:10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border:
            Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
      ),
      child: DropdownButton<String>(
        value: selectedMenu,
        hint: const Text('Select Menu'),
        isExpanded: true,
        items: menuOptions.map((String menu) {
          return DropdownMenuItem<String>(
            value: menu,
            child: Text(menu),
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

  Widget _buildHalalStatusDropdown() {
    return Container(
      height: 40,
      padding:EdgeInsets.only(left:10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border:
            Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
      ),
      child: DropdownButton<String>(
        value: selectedMenu,
        hint: const Text('Select Status'),
        isExpanded: true,
        items: HalalStatus.map((String halal) {
          return DropdownMenuItem<String>(
            value: halal,
            child: Text(halal),
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
        title: const Text('Add Product', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
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
                      _buildLabel('Product Name'),
                      const SizedBox(height: 6),
                      _buildTextField(
                          controller: _menuNameController,
                          hintText: 'Name',
                          iconData: Icons.person),
                      const SizedBox(height: 12),
                      _buildLabel('Price'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: _buildCurrencyDropdown(),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 6,
                            child: _buildTextField(
                                controller: _priceController,
                                hintText: 'Enter Price',
                                iconData: Icons.attach_money),
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
                                _buildLabel('Menu'),
                                const SizedBox(height: 6),
                                _buildMenuDropdown(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('Status'),
                                const SizedBox(height: 6),
                                _buildStatusDropdown(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('Halal Status'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child:
                                _buildHalalStatusDropdown(), //ths wont work man
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('Product UPC'),
                      const SizedBox(height: 8),
                      _buildTextField(
                          controller: _statusController,
                          hintText: 'Enter Product UPC',
                          iconData: FontAwesomeIcons.barcode),
                      const SizedBox(height: 12),
                      _buildLabel('Menu Photo'),
                      const SizedBox(height: 8),
                      _buildFilePicker(),
                      const SizedBox(height: 20),
                      _buildActionButtons(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                      _buildLabel('Product Description'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Description',
                        maxLines: 5,
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(height: 8),
                      const SizedBox(height: 8),
                      _buildLabel('Ingredients'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child:
                                _buildIngredientsDropdown(), //ths wont work man
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildCustomButton('ADD Missing Ingredients', () {
                        Navigator.pushNamed(context, '/addingredients');
                      }),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLabel('Carbs'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Enter Carbs',
                        iconData: FontAwesomeIcons.plateWheat,
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('Saturated Fats For Carbs'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Enter Saturated Fats For Carbs',
                        iconData: FontAwesomeIcons.droplet,
                        iconColor: Color(0xFF47A851),
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('Trans Fats For Carbs'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Enter Trans Fats For Carbs',
                        iconData: FontAwesomeIcons.droplet,
                        iconColor: Color(0xFFC33232),
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('Protien'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Enter Protien',
                        iconData: FontAwesomeIcons.bolt,
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('Fat'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Enter Fat',
                        iconData: Icons.fastfood,
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('Saturated Fat For Fat'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Enter Saturated Fat For Fat',
                        iconData: FontAwesomeIcons.droplet,
                        iconColor: Color(0xFF47A851),
                      ),
                      const SizedBox(height: 8),
                      _buildLabel('Trans Fat For Fat'),
                      const SizedBox(height: 6),
                      _buildTextField(
                        controller: _menuNameController,
                        hintText: 'Enter Trans Fat For Fat',
                        iconData: FontAwesomeIcons.droplet,
                        iconColor: Color(0xFFC33232),
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: _isBestSelling,
                            onChanged: (bool? value) {
                              setState(() {
                                _isBestSelling = value ?? false; // Update the state
                              });
                            },
                          ),
                          Text(
                            "Product Marked as Best Selling/Popular",
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff252525),
                              height: 14 / 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),


                      const SizedBox(height: 8),
                      _buildcancleButtons(),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Row(
      children: [
        Text(text,
            style: const TextStyle(fontSize: 14, color: Color(0xFF000000)
            )),
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

  Widget _buildCustomButton(String text, VoidCallback onPressed) {
    return Align(
      alignment: Alignment.centerLeft, // Align to the left
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF47A851),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
            size: 18.0, // Set the desired icon size
          )
              : null,
        ),
      ),
    );

  }
  Widget _buildcancleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle submit action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF47A851),
            minimumSize: const Size(130, 30),
            padding: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text(
            'Submit',
            style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF6F6F6),
            minimumSize: const Size(130, 30),
            padding: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 14, color: Color(0xFF47A851), fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}