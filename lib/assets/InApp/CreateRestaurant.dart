import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateRestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Create Restaurant Features',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFFE3F5E4),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: CreateRestaurantForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateRestaurantForm extends StatefulWidget {
  @override
  _CreateRestaurantFormState createState() => _CreateRestaurantFormState();
}

class _CreateRestaurantFormState extends State<CreateRestaurantForm> {
  final TextEditingController nameController = TextEditingController();
  String? fileName;



  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    IconData? iconData,
    Color? iconColor,
    int maxLines = 1,
  }) {
    return Container(
      height: maxLines == 1 ? 40 : null,
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
              ? Icon(iconData, color: iconColor ?? Color(0xFF888888))
              : null,
        ),
      ),
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
                  style: const TextStyle(fontSize: 14, color: Color(0xFF888888)),
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
  Future<void> _chooseFile() async {
    // Request storage permission
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      // Permission granted, proceed to file picker
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          fileName = result.files.single.name;
        });
      }
    } else if (status.isDenied) {
      // Permission denied, show a message
      print("Storage permission denied");
    } else if (status.isPermanentlyDenied) {
      // If the permission is permanently denied, guide the user to settings
      openAppSettings();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            text: 'Service Name',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(text: '*', style: TextStyle(color: Color(0xFFE70101))),
            ],
          ),
        ),
        SizedBox(height: 8),
        _buildTextField(
          controller: nameController,
          hintText: 'Name',
          iconData: Icons.person,
        ),
        SizedBox(height: 16),

        Text(
          'Image',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        _buildFilePicker(),
        SizedBox(height: 16),

        Text(
          'Status',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),

        Container(
          height: 40,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: 'Select Status',
              hintStyle: TextStyle(
                color: Color(0xFF888888),
                fontFamily: 'Roboto',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.0,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2), width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2), width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.blue, width: 0.5),
              ),
            ),
            value: 'Active',
            items: <String>['Active', 'Inactive']
                .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            )).toList(),
            onChanged: (newValue) {},
          ),
        ),

        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF47A851),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                fixedSize: Size(140, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () { Navigator.of(context).pop(); },
              child: Text('Cancel'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Color(0xFF47A851),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                fixedSize: Size(140, 40),
                side: BorderSide(color: Color(0xFF47A851)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}