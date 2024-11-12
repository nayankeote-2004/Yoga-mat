import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Session Analytics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Sessions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildAnimatedBar(15, Colors.green),
            SizedBox(height: 24),
            Text('Most Used Mode', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildAnimatedBar(30, Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedBar(int value, Color color) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 20,
      width: value * 10.0, // scale width by value
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
