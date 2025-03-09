import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'sensor_page.dart';
import 'assigned_farms.dart';
import 'active_tasks.dart';
import 'alerts_page.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  TextEditingController _notesController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _notesController.text = prefs.getString('technician_notes') ?? '';
    });
  }

  void _saveNotes() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(seconds: 1), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('technician_notes', _notesController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notes saved!')),
      );
    });
  }

  void _handleAlertClick(String level) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$level alert clicked!')),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technician Dashboard'),
        backgroundColor: Colors.green[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green[700]),
              child: Text('Technician Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            _buildDrawerItem(Icons.map, 'Assigned Farms', AssignedFarmsPage()),
            _buildDrawerItem(Icons.task, 'Active Tasks', ActiveTasksPage()),
            _buildDrawerItem(Icons.warning, 'Alerts & Issues', AlertsPage()),
            _buildDrawerItem(Icons.sensors, 'Sensor Data', SensorPage()),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to the Technician Dashboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Task Completion Progress'),
            LinearProgressIndicator(value: 0.7, color: Colors.green),
            SizedBox(height: 20),
            Text('Alert Severity Levels'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAlertButton('Critical', Colors.red),
                _buildAlertButton('Moderate', Colors.orange),
                _buildAlertButton('Low', Colors.yellow),
              ],
            ),
            SizedBox(height: 20),
            Text('Technician Notes'),
            TextField(
              controller: _notesController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _saveNotes(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }

  Widget _buildAlertButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () => _handleAlertClick(label),
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}
