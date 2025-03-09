import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSectionTitle('Developer Details'),
              _buildColoredBox(
                'This app was developed by a passionate team of developers who are dedicated to leveraging AI technology to improve crop health and yield. Our team consists of experienced professionals in the fields of software development, machine learning, and agricultural science.',
              ),
              SizedBox(height: 16),
              _buildSectionTitle('Team Members'),
              _buildColoredBox(
                  '- Ajith : Lead Developers\n'
                      '- Akshith Shanagonda:AI,APP UI \n'
                      '- Ajith Shanagonda:AI, IOT,Backend integration'

              ),
              SizedBox(height: 16),
              _buildSectionTitle('Contact Us'),
              _buildColoredBox(
                'For any inquiries or collaboration opportunities, please contact us at:\n'
                    'Email: developers@aicropcare.com\n'
                    'Phone: +91 9490277574',
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