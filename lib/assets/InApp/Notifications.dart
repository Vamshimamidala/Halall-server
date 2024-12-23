import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<dynamic> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    try {
      final response = await http.get(Uri.parse('http://10.82.10.109:3000/notifications'));
      if (response.statusCode == 200) {
        setState(() {
          notifications = json.decode(response.body);
          isLoading = false;
        });
      } else {
        print('Failed to load notifications. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color:Colors.white,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationCard(
                    name: notification['name'],
                    action: notification['action'],
                    category: notification['category'],
                    dateTime: notification['dateTime'],
                  );
                },
              ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String name;
  final String action;
  final String category;
  final String dateTime;

  const NotificationCard({super.key,
    required this.name,
    required this.action,
    required this.category,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromRGBO(0, 0, 0, 0.20), // rgba(0, 0, 0, 0.20)
          width: 0.5, // Border width in logical pixels
        ),
        borderRadius: BorderRadius.circular(8.0), // Optional: Adjust border radius if needed
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: const Color(0xFFE3F5E4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: 44, // Width of the circle
                  height: 44, // Height of the circle
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9C676), // Circle fill color
                    shape: BoxShape.circle, // Circular shape
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 3, // Border width (adjust as needed)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: const Offset(0, 3), // Shadow position (x, y)
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.notifications, // Bell icon
                    color: Colors.white, // Icon color (customize as needed)
                    size: 24, // Icon size (adjust as needed to fit nicely inside the circle)
                  ),
                ),
                const SizedBox(height: 8),



              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Color(0xFF252525), // #252525 color
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          height: 1.0, // Equivalent to 'line-height: normal'
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        action,
                        style: const TextStyle(
                          color: Color(0xFF252525), // #252525 color
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Regular weight
                          fontStyle: FontStyle.normal,
                          height: 1.0, // Line-height equivalent
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height:4,),
                  Text(
                    category,
                    style: const TextStyle(
                      color: Color(0xFF6D6D6D), // #6D6D6D color
                      fontFamily: 'Roboto',
                      fontSize: 10,
                      fontWeight: FontWeight.w400, // Regular weight
                      fontStyle: FontStyle.normal,
                      height: 1.0, // Line-height equivalent
                    ),
                  ),
                  const SizedBox(height:10,),
                  Text(
                    dateTime,
                    style: const TextStyle(
                      color: Color(0xFF252525), // #252525 color
                      fontFamily: 'Roboto',
                      fontSize: 10,
                      fontWeight: FontWeight.w400, // Regular weight
                      fontStyle: FontStyle.normal,
                      height: 1.0, // Line-height equivalent
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