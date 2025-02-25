import 'package:flutter/material.dart';
import 'package:key_board_app/Services/HandwritingService.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HandwritingScreen extends StatefulWidget {
  @override
  _HandwritingScreenState createState() => _HandwritingScreenState();
}

class _HandwritingScreenState extends State<HandwritingScreen> {
  final HandwritingService _handwritingService = HandwritingService();
  String _recognizedText = "Draw Hindi characters or upload an image.";
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      _processImage(pickedFile.path);
    }
  }

  Future<void> _processImage(String imagePath) async {
    String text = await _handwritingService.recognizeHandwriting(imagePath);
    setState(() {
      _recognizedText = text.isNotEmpty ? text : "No Hindi text recognized.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Handwriting Recognition")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_selectedImage != null)
                Image.file(_selectedImage!, height: 150),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  _recognizedText,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white),
                onPressed: _pickImage,
                child: Text("Upload Handwritten Image"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
