import 'package:flutter/material.dart';

class SelectAccountTypePage extends StatefulWidget {
  @override
  _SelectAccountTypePageState createState() => _SelectAccountTypePageState();
}

class _SelectAccountTypePageState extends State<SelectAccountTypePage> {
  bool isTechnicianSelected = false;

  Widget _buildStyledButton(String text, VoidCallback onPressed, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 14.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 5,
          shadowColor: Colors.black54,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Account Type'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/b1.webp"), // Ensure the image is in assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!isTechnicianSelected) ...[
                  _buildStyledButton("Farmer", () {
                    Navigator.pushReplacementNamed(context, '/home'); // Directly navigate to Home
                  }, Colors.green),
                  _buildStyledButton("Technician", () {
                    setState(() {
                      isTechnicianSelected = true;
                    });
                  }, Colors.blue),
                ],

                // Technician Section
                if (isTechnicianSelected) ...[
                  Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 8,
                    child: Column(
                      children: [
                        _buildStyledButton("Technician Overview", () {
                          Navigator.pushNamed(context, '/overview');
                        }, Colors.blue.shade600),
                        _buildStyledButton("Back", () {
                          setState(() {
                            isTechnicianSelected = false;
                          });
                        }, Colors.red),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}