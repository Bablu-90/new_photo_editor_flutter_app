import 'package:flutter/material.dart';
import 'package:new_photo_editor_flutter_app/screens/slider_menu.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SliderMenu(),
      appBar: AppBar(
        title: Text("LogOut"),
      ),
      backgroundColor: Colors.blueAccent.shade200,
      body: Container(),
    );
  }
}
