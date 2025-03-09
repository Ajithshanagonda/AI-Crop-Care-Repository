import 'package:flutter/material.dart';

class PrincipalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Details about the Principal will be here.'),
      ),
    );
  }
}