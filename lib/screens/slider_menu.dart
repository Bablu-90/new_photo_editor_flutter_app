import 'package:flutter/material.dart';
import 'package:new_photo_editor_flutter_app/screens/add_images.dart';
import 'package:new_photo_editor_flutter_app/screens/logout_screen.dart';
import 'package:new_photo_editor_flutter_app/screens/notification_screen.dart';
import 'package:new_photo_editor_flutter_app/screens/settings_screen.dart';

class SliderMenu extends StatefulWidget {
  const SliderMenu({Key? key}) : super(key: key);

  @override
  State<SliderMenu> createState() => _SliderMenuState();
}

class _SliderMenuState extends State<SliderMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      padding: const EdgeInsets.only(
        top: 30,
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 52,
                backgroundColor: Colors.blueGrey,
                child: CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage("assets/images/camera.png"),
                ),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" RITIK EDIXX",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ],
          ),
          ListTile(
              title: Text('Home'),
              textColor: Colors.black,
              iconColor: Colors.lightBlueAccent,
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
              }),
          ListTile(
              title: Text('Add New Image'),
              textColor: Colors.black,
              iconColor: Colors.green,
              leading: Icon(Icons.add_circle_outlined),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddImage()))),
          ListTile(
              title: Text('Notification'),
              textColor: Colors.black,
              iconColor: Colors.teal,
              leading: Icon(Icons.notifications_active_rounded),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen()))),
          ListTile(
              title: Text('Settings'),
              textColor: Colors.black,
              iconColor: Colors.blue,
              leading: Icon(Icons.settings),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Settings()))),
          ListTile(
              title: Text('LogOut'),
              textColor: Colors.black,
              iconColor: Colors.redAccent,
              leading: Icon(Icons.arrow_back_ios_outlined),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LogOut()))),
        ],
      ),
    );
  }

  onItemClick(String SliderMenuItem) {}
}
