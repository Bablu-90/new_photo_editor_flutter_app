import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:new_photo_editor_flutter_app/screens/icon_widget.dart';

class NotificationScreen extends StatefulWidget {
  String keyNews = 'key-news';
  String keyActivity = 'key-activity';
  String keyAppUpdates = 'key-appUpdates';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'My Notification',
        subtitle: 'Newsletter, App Updates',
        leading: IconWidget(
          icon: Icons.notifications_active,
          color: Colors.redAccent,
        ),
        child: SettingsScreen(title: 'Notifications', children: <Widget>[
          buildNews(),
          buildActivity(),
          buildAppUpdate(),
        ]),
      );

  Widget buildNews() => SwitchSettingsTile(
        title: 'News for You',
        settingKey: widget.keyNews,
        leading:
            IconWidget(icon: Icons.message_outlined, color: Colors.blueAccent),
      );
  Widget buildActivity() => SwitchSettingsTile(
        title: 'Account Activity',
        settingKey: widget.keyActivity,
        leading: IconWidget(icon: Icons.person, color: Colors.deepOrange),
      );
  Widget buildAppUpdate() => SwitchSettingsTile(
        title: 'App Update',
        settingKey: widget.keyAppUpdates,
        leading:
            IconWidget(icon: Icons.message_outlined, color: Colors.blueAccent),
      );
}
