import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShowPicker extends StatefulWidget {
  const ShowPicker({Key? key}) : super(key: key);

  static pickImage({required source, required int imageQuality}) {}

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

File _image = _image;

_imgFromCamera() async {
  File image =
      await ShowPicker.pickImage(source: ImageSource.camera, imageQuality: 50);

  setState(() {
    _image = image;
  });
}

void setState(Null Function() param0) {}

_imgFromGallery() async {
  File image =
      await ShowPicker.pickImage(source: ImageSource.gallery, imageQuality: 50);

  setState(() {
    _image = image;
  });
}

class _ShowPickerState extends State<ShowPicker> {
  _ShowPickerState(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: <Widget>[
          const SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
                onTap: () {
                  _ShowPickerState(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.blue.shade300,
                )),
          ),
        ]));
  }
}
