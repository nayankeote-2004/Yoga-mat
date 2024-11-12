import 'package:flutter/material.dart';

class ShowcaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feature Showcase')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFeatureCard(
            'Mat Temperature Control',
            'Set a comfortable temperature for your yoga session.',
            'assets/temprature.png',
          ),
          _buildFeatureCard(
            'Heart Rate Monitor',
            'Track your heart rate to stay in your optimal range.',
            'assets/heart_rate.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String description, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Image.asset(imagePath, height: 120, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(description, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
