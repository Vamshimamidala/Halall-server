import 'package:flutter/material.dart';

class Customscaffold extends StatelessWidget {
  final Widget child;  // Accept any widget as a child

  const Customscaffold({required this.child, super.key}); // Constructor now accepts a child

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'lib/assets/bg1.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // The child widget passed to Customscaffold
          child,
        ],
      ),
    );
  }
}