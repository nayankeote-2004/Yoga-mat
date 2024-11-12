// bluetooth_service.dart

class BluetoothService {
  static bool _isConnected = false;

  /// Simulates connecting to the smart yoga mat.
  /// In a real app, you'd use a Bluetooth package here.
  static bool connect() {
    _isConnected = true;
    return _isConnected;
  }

  /// Simulates disconnecting from the smart yoga mat.
  static bool disconnect() {
    _isConnected = false;
    return _isConnected;
  }

  /// Checks if the mat is currently connected.
  static bool get isConnected => _isConnected;
}
