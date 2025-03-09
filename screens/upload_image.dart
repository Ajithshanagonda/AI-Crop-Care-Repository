import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';
import 'dart:html' as html; // ✅ For web image handling

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  XFile? _image;
  Uint8List? _webImage; // ✅ Web image handling
  bool _isLoading = false;
  String? _result;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      if (kIsWeb) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _image = pickedFile;
          _webImage = bytes; // ✅ Store web image
        });
      } else {
        setState(() {
          _image = pickedFile;
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      _showDialog('Error', 'Please select an image first.');
      return;
    }

    setState(() {
      _isLoading = true;
      _result = null;
    });

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.104.42:5000/detect_disease'),
      );

      if (kIsWeb) {
        request.files.add(http.MultipartFile.fromBytes(
          'image',
          _webImage!,
          filename: _image!.name, // ✅ Web file upload fix
        ));
      } else {
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          _image!.path,
        ));
      }

      final response = await request.send();
      final respStr = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final result = jsonDecode(respStr);
        setState(() {
          _result = result['disease'];
          _isLoading = false;
        });
        _showDialog('Detection Results', 'Disease: ${result['disease']}');
      } else {
        setState(() => _isLoading = false);
        _showDialog('Error', 'Failed to upload image. Server Response: $respStr');
      }
    } catch (e) {
      setState(() => _isLoading = false);
      _showDialog('Error', 'An error occurred: $e');
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.', style: TextStyle(fontSize: 16))
                : kIsWeb
                ? Image.memory(_webImage!, height: 200) // ✅ Web image display fix
                : Image.file(File(_image!.path), height: 200),
            SizedBox(height: 20),
            if (_isLoading) CircularProgressIndicator(),
            if (_result != null)
              Text('Prediction: $_result', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.image),
              label: Text('Pick from Gallery'),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.camera),
              label: Text('Take a Picture'),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _uploadImage, // ✅ Prevent multiple uploads
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
