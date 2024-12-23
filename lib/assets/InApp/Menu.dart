import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // To parse JSON

// Student model
class Student {
  final int id;
  final String email;
  final String firstName;
  final String lastName;

  Student({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Student> _students = [];
  final ScrollController _horizontalScrollController = ScrollController();
  double _horizontalScrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    fetchStudents();

    // Listener to update the position of the custom scrollbar
    _horizontalScrollController.addListener(() {
      setState(() {
        _horizontalScrollPosition = _horizontalScrollController.offset /
            (_horizontalScrollController.position.maxScrollExtent);
      });
    });
  }

  // Fetching students data from API
  Future<void> fetchStudents() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      // Parse the JSON data
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> studentData = data['data'];

      setState(() {
        _students = studentData.map((json) => Student.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load students');
    }
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(60.0), // Set your custom height here
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashbord');
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
          title: const Text(
            'Manage Menu',
            style: TextStyle(fontSize: 20),
          ),

          backgroundColor: Colors.white, // Set app bar color to green
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              height: sHeight * 0.05,
              padding: const EdgeInsets.only(
                  right: 5, left: 5, bottom: 12), // Padding inside the container
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(8), // Rounded corners
                border: Border.all(
                  color: Colors.black.withOpacity(0.20), // rgba(0, 0, 0, 0.20)
                  width: 0.5, // 0.5px solid
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0), // Padding for the icon
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search By Menu Name....',
                        hintStyle: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                        ),
                        border: InputBorder.none, // Remove the default border
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, right: 10),
              height: sHeight * 0.05, // Height of the button
              width: 150, // Fixed width of the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'/addmenu');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5), // Horizontal padding
                  backgroundColor: const Color(0xFF47A851), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  elevation: 0, // No shadow
                ),
                child: const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center text horizontally
                  children: [
                    Text(
                      'Create New Menu',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontFamily: 'Roboto', // Font family
                        fontSize: 14, // Font size
                        fontWeight: FontWeight.w600, // Font weight
                      ),
                    ),
                  ],
                ),
              ),
            ),



            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                color: const Color(0xFFE3F5E4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 20, top: 20),
                  child: _students.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                    height: sHeight * 0.6, // Set a fixed height for the table area
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFE3F5E4),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _horizontalScrollController,
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.all(Colors.white),
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'ID',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'First Name',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Last Name',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                          rows: _students
                              .map(
                                (student) => DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    student.id.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    student.firstName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    student.lastName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    student.email,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}