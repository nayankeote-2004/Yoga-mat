import 'package:flutter/material.dart';
import '../services/bluetooth_service.dart';
import 'home_screen.dart';

class ConnectionScreen extends StatefulWidget {
  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  bool isConnecting = true;
  String connectionStatus = 'Connecting to Yoga Mat...';

  @override
  void initState() {
    super.initState();
    _connectToMat();
  }

  Future<void> _connectToMat() async {
    try {
      // Simulate a Bluetooth connection with a delay or call actual Bluetooth service here
      await BluetoothService.connect(); // Replace with actual connection method if available

      // If connection is successful
      setState(() {
        isConnecting = false;
        connectionStatus = 'Connected Successfully!';
      });

      // After a short delay, navigate to the HomeScreen
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    } catch (e) {
      // If connection fails
      setState(() {
        isConnecting = false;
        connectionStatus = 'Connection Failed. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isConnecting
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            )
                : Icon(
              connectionStatus.contains('Failed') ? Icons.error : Icons.check_circle,
              color: connectionStatus.contains('Failed') ? Colors.red : Colors.green,
              size: 60,
            ),
            SizedBox(height: 20),
            Text(
              connectionStatus,
              style: TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            if (connectionStatus.contains('Failed'))
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: _connectToMat,
                  child: Text('Retry Connection'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
