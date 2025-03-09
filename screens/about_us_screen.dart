import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSectionTitle('About AI Crop Care'),
              _buildColoredBox(
                'AI Crop Care is an innovative app designed to help farmers monitor and manage their crops effectively. Using advanced AI technology, the app provides real-time insights and recommendations to ensure optimal crop health and yield.',
              ),
              SizedBox(height: 16),
              _buildSectionTitle('Key Features'),
              _buildColoredBox(
                '- Plant Monitoring: Track temperature and humidity levels in real-time.\n'
                    '- Plant Detection: Identify plant species and detect diseases using image recognition.\n'
                    '- Disease Detection & Precautions: Get detailed information about plant diseases and recommended precautions.\n'
                    '- Farmer Support: Access various tools and resources to support your farming activities.\n'
                    '- Notifications: Stay informed about the latest updates, discounts, and events related to crop care.',
              ),
              SizedBox(height: 16),
              _buildSectionTitle('Our Mission'),
              _buildColoredBox(
                'Our mission is to empower farmers with the latest AI technology to improve crop health and yield. We strive to provide valuable insights and support to help farmers make informed decisions and achieve sustainable farming practices.',
              ),
              SizedBox(height: 16),
              _buildSectionTitle('Contact Us'),
              _buildColoredBox(
                'For any inquiries or support, please contact us at:\n'
                    'Email: support@aicropcare.com\n'
                    'Phone: +91 12345 67890',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildColoredBox(String content) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue),
      ),
      child: Text(
        content,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
