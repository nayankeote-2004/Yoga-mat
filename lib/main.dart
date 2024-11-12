import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yoga_mat_ass/screens/connection_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SmartYogaMatApp());
}

class SmartYogaMatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Yoga Mat',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ConnectScreen(),
    );
  }
}
