import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  bool isOceanPlaying = false;
  bool isAmbientPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Music & Sounds')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSoundTile('Ocean Waves', Icons.waves, isOceanPlaying, (value) {
            setState(() {
              isOceanPlaying = value;
            });
          }),
          _buildSoundTile('Ambient Music', Icons.music_note, isAmbientPlaying, (value) {
            setState(() {
              isAmbientPlaying = value;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildSoundTile(String title, IconData icon, bool isPlaying, Function(bool) toggle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle, color: isPlaying ? Colors.green : Colors.grey),
        ),
        title: Text(title, style: TextStyle(fontSize: 18)),
        trailing: Switch(value: isPlaying, onChanged: toggle),
        onTap: () => toggle(!isPlaying),
      ),
    );
  }
}
