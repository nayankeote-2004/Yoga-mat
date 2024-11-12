import 'package:flutter/material.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  // Boolean states for each control option
  bool isWarmUpActive = false;
  bool isRelaxationActive = false;
  bool isBreathingActive = false;
  bool isStretchingActive = false;
  bool isStrengthActive = false;
  bool isMeditationActive = false;
  bool isBalanceActive = false;
  bool isCoolDownActive = false;

  // Toggle functions for each control option
  void toggleWarmUp() => setState(() => isWarmUpActive = !isWarmUpActive);
  void toggleRelaxation() => setState(() => isRelaxationActive = !isRelaxationActive);
  void toggleBreathing() => setState(() => isBreathingActive = !isBreathingActive);
  void toggleStretching() => setState(() => isStretchingActive = !isStretchingActive);
  void toggleStrength() => setState(() => isStrengthActive = !isStrengthActive);
  void toggleMeditation() => setState(() => isMeditationActive = !isMeditationActive);
  void toggleBalance() => setState(() => isBalanceActive = !isBalanceActive);
  void toggleCoolDown() => setState(() => isCoolDownActive = !isCoolDownActive);

  // Widget for each control button to avoid code duplication
  Widget buildControlButton({
    required bool isActive,
    required VoidCallback onTap,
    required String title,
    required IconData icon,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isActive ? Colors.white : activeColor),
        title: Text(
          title,
          style: TextStyle(color: isActive ? Colors.white : Colors.black),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: isActive ? Colors.white : Colors.black,
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Panel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildControlButton(
              isActive: isWarmUpActive,
              onTap: toggleWarmUp,
              title: 'Start Warm-Up',
              icon: Icons.play_circle_fill,
              activeColor: Colors.greenAccent,
              inactiveColor: Colors.grey.shade200,
            ),
            SizedBox(height: 16),
            buildControlButton(
              isActive: isRelaxationActive,
              onTap: toggleRelaxation,
              title: 'Begin Relaxation Mode',
              icon: Icons.self_improvement,
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.grey.shade200,
            ),
            SizedBox(height: 16),
            buildControlButton(
              isActive: isBreathingActive,
              onTap: toggleBreathing,
              title: 'Breathing Exercise',
              icon: Icons.air,
              activeColor: Colors.purpleAccent,
              inactiveColor: Colors.grey.shade200,
            ),
            SizedBox(height: 16),
            buildControlButton(
              isActive: isStretchingActive,
              onTap: toggleStretching,
              title: 'Stretching Routine',
              icon: Icons.accessibility,
              activeColor: Colors.orangeAccent,
              inactiveColor: Colors.grey.shade200,
            ),
            SizedBox(height: 16),
            buildControlButton(
              isActive: isStrengthActive,
              onTap: toggleStrength,
              title: 'Strength Training',
              icon: Icons.fitness_center,
              activeColor: Colors.redAccent,
              inactiveColor: Colors.grey.shade200,
            ),
            SizedBox(height: 16),
            buildControlButton(
              isActive: isMeditationActive,
              onTap: toggleMeditation,
              title: 'Meditation Mode',
              icon: Icons.spa,
              activeColor: Colors.tealAccent,
              inactiveColor: Colors.grey.shade200,
            ),
            SizedBox(height: 16),
            buildControlButton(
              isActive: isBalanceActive,
              onTap: toggleBalance,
              title: 'Balance Practice',
              icon: Icons.accessibility_new,
              activeColor: Colors.yellowAccent,
              inactiveColor: Colors.grey.shade200,
            ),
            SizedBox(height: 16),
            buildControlButton(
              isActive: isCoolDownActive,
              onTap: toggleCoolDown,
              title: 'Cool Down',
              icon: Icons.nights_stay,
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.grey.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
