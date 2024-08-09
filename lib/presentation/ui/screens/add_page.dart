import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:io';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  File? _image;
  String _scannedText = '';

  Future<void> _pickImage() async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _scanTextFromImage();
    }
  }

  Future<void> _scanTextFromImage() async {
    final inputImage = InputImage.fromFile(_image!);
    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    setState(() {
      _scannedText = recognizedText.text;
    });
    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Document'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_image != null)
              Image.file(
                _image!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Take Picture'),
            ),
            SizedBox(height: 16),
            if (_scannedText.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _scannedText,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            if (_scannedText.isEmpty && _image != null)
              Text('No text recognized.'),
          ],
        ),
      ),
    );
  }
}
