import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> _requestPermissions() async {
  await Permission.storage.request();
}

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({super.key});

  @override
  _AddMenuPageState createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final TextEditingController _menuNameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  String? fileName;

  Future<void> _chooseFile() async {
    // Check if storage permission is granted
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // Request permission if not granted
      await _requestPermissions();
      status = await Permission.storage.status; // Check again
    }

    if (status.isGranted) {
      // Open file picker
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          fileName = result.files.single.name;
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

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Menu', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),

      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
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
                _buildLabel('Menu Name'),
                const SizedBox(height: 8),
                _buildTextField(controller: _menuNameController, hintText: 'Name', icon: Icons.person),
                const SizedBox(height: 12),
                _buildLabel('Menu Photo'),
                const SizedBox(height: 8),
                _buildFilePicker(),
                const SizedBox(height: 12),
                _buildLabel('Status'),
                const SizedBox(height: 8),
                _buildTextField(controller: _statusController, hintText: 'Enter Status'),
                const SizedBox(height: 20),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Row(
      children: [
        Text(text, style: const TextStyle(fontSize: 12, color: Color(0xFF888888))),
        const Text('*', style: TextStyle(fontSize: 12, color: Colors.red)), // Asterisk in red
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
                  color: const Color.fromRGBO(0, 0, 0, 0.2),
                  width: 0.5,
                ),
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

  Widget _buildTextField({required TextEditingController controller, required String hintText, IconData? icon}) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
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
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          prefixIcon: icon != null
              ? Icon(
            icon,
            color: Color(0xFF888888),
            size: 18.0, // Specify the desired size of the icon
          )
              : null,
        ),
      ),
    );
  }
}