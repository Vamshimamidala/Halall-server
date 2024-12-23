import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // For star rating

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Card(

                color:const Color(0xFFEFEFEF),

                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Review container
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with user info and review date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:const EdgeInsets.only(bottom:20),
                                    child: Row(
                                      children: [
                                        Image.asset('lib/assets/Hglogo.png'),
                                        const SizedBox(width: 20,),
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start, // Aligns both texts to the start
                                          children: [
                                            Text(
                                              'HalalGuide', // Username
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              '2024-08-15 19:04:33', // Review date
                                              style: TextStyle(color: Colors.grey, fontSize: 12),
                                            ),
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                  // Star rating on the left
                                  RatingBar.builder(
                                    initialRating: 4.5, // Initial rating
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      // Do something with rating if needed
                                    },
                                  ),
                                  const SizedBox(width: 10),

                                ],
                              ),

                            ],
                          ),
                          const SizedBox(height: 8),

                          // Review text
                          const Text(
                            'Best Indian street food ❤️❤️', // Review text
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Reply section
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color:
                        Colors.lightGreen[100], // Light green background for reply
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: screenWidth * 0.65,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Reply label
                            Text(
                              'Reply', // Reply label
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),

                            // Reply content
                            Text(
                              'asdcsfvsdvfcv', // Reply text
                              style: TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                            SizedBox(height: 10),

                            // Reply date at the bottom
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                '2024-10-04 15:14:43', // Reply date
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                                ),
                ),
              ), ],
          ),
        ),
      ),
    );
  }
}