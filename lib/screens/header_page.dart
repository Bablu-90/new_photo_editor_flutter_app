import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:new_photo_editor_flutter_app/screens/icon_widget.dart';

class HeaderPage extends StatelessWidget {
  static String keyDarkMode = 'key-dark-mode';
  static String keyUser = 'key-user';
  @override
  Widget build(BuildContext context) {
    Widget buildUser() => SwitchSettingsTile(
          title: 'User',
          settingKey: keyUser,
          leading:
              IconWidget(icon: Icons.verified_user, color: Colors.purpleAccent),
        );
    Widget buildHeader() => Center(
          child: Text(
            'Settings',
          ),
        );
    Widget buildDarkMode() => SwitchSettingsTile(
          title: 'Dark Mode',
          settingKey: keyDarkMode,
          leading: IconWidget(
            icon: Icons.dark_mode_sharp,
            color: Color(0xFF642ef3),
          ),
          onChange: (_) {},
        );
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: 70,
        ),
        buildHeader(),
        SizedBox(
          height: 70,
          child: buildUser(),
        ),
        Center(
          child: buildDarkMode(),
        )
      ],
    );
  }
}
