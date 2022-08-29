import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_settings_screens/src/widgets/settings_widgets.dart';
import 'package:new_photo_editor_flutter_app/screens/icon_widget.dart';
import 'package:new_photo_editor_flutter_app/screens/notification_screen.dart';

import '../utilities/utils.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();

  static void clearCache() {
    Settings.clearCache();
  }
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Widget buildReportBug(buildContext) => SimpleSettingsTile(
          title: 'Report A Bug',
          subtitle: '',
          leading: IconWidget(icon: Icons.bug_report, color: Colors.tealAccent),
          onTap: () => Utils.showSnackBar(context, 'Clicked Report  A Bug'),
        );

    Widget buildSendFeedback(buildContext) => SimpleSettingsTile(
          title: 'Send Feedback',
          subtitle: '',
          leading: IconWidget(icon: Icons.thumb_up, color: Colors.purpleAccent),
          onTap: () => Utils.showSnackBar(context, 'Clicked SendFeedback'),
        );

    Widget buildLogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: IconWidget(icon: Icons.logout, color: Colors.deepPurpleAccent),
        onTap: () {
          Settings.clearCache();
          Utils.showSnackBar(context, 'Clicked Logout');
        });

    Widget buildDeleteAccount() => SimpleSettingsTile(
          title: 'Delete Account',
          subtitle: '',
          leading: IconWidget(icon: Icons.delete_forever, color: Colors.red),
          onTap: () => Utils.showSnackBar(context, 'Clicked Deleted'),
        );
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.blue.shade200,
            fontSize: 25,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic),
        backgroundColor: Colors.blue.shade200,
        title: Text("Settings "),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SettingsGroup(
                title: 'GENERAL',
                children: <Widget>[
                  buildLogout(),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  /*AccountPage(),
                  SizedBox(
                    height: 70,
                    width: 70,
                  ),
                  NotificationScreen(),
                  SizedBox(
                    height: 70,
                    width: 70,
                  ),*/
                  buildDeleteAccount(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SettingsGroup(title: 'FEEDBACK', children: <Widget>[
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                buildReportBug(context),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                buildSendFeedback(context),
              ]),
              SizedBox(
                height: 20,
                width: 20,
              ),
              NotificationScreen(),
              SizedBox(
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
