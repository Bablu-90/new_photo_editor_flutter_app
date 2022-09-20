import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ShowPicker extends StatefulWidget {
  const ShowPicker({Key? key}) : super(key: key);

  @override
  State<ShowPicker> createState() => _ShowPickerState();
}

class _ShowPickerState extends State<ShowPicker> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Image not Picked Failed: $e!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade100,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade100,
          title: Text(
            "Pick Images",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
            MaterialButton(
                color: Colors.blueGrey,
                child: Text(
                  'Pick My Images From Gallery',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  pickImage(ImageSource.gallery);
                }),
            MaterialButton(
                color: Colors.blue.shade300,
                child: Text(
                  'Pick My Images From Camera',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  pickImage(ImageSource.camera);
                }),
            SizedBox(
              width: 30,
            ),
            image != null ? Image.file(image!) : Text('No Image Selected')
          ],
        ));
  }
}
