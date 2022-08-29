import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:new_photo_editor_flutter_app/screens/icon_widget.dart';
import 'package:new_photo_editor_flutter_app/utilities/utils.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';

  @override
  Widget build(BuildContext context) {
    Widget buildLocation() => TextInputSettingsTile(
          title: 'Location',
          settingKey: keyLocation,
          initialValue: 'India',
          onChange: (Location) {/*No*/},
        );
    Widget buildPassword() => TextInputSettingsTile(
          title: 'Password',
          settingKey: keyPassword,
          obscureText: true,
          validator: (password) => password != null && password.length >= 6
              ? null
              : 'Enter 6 characters',
        );
    Widget buildLanguage() => DropDownSettingsTile(
        title: 'Language',
        settingKey: keyLanguage,
        selected: 1,
        values: <int, String>{
          1: 'English',
          2: 'Hindi',
          3: 'Spanish',
        },
        onChange: (language) {/* No */});
    Widget buildPrivacy(buildContext) => SimpleSettingsTile(
          title: 'Privacy',
          subtitle: '',
          leading: IconWidget(icon: Icons.lock, color: Colors.blueAccent),
          onTap: () => Utils.showSnackBar(context, 'Clicked Privacy'),
        );
    Widget buildSecurity(buildContext) => SimpleSettingsTile(
          title: 'Security',
          subtitle: '',
          leading: IconWidget(
              icon: Icons.security_outlined,
              color: Colors.deepOrangeAccent.shade200),
          onTap: () => Utils.showSnackBar(context, 'Clicked Security'),
        );
    Widget buildAccountInfo(buildContext) => SimpleSettingsTile(
          title: 'Account Info',
          subtitle: '',
          leading: IconWidget(
              icon: Icons.text_snippet_outlined, color: Colors.purpleAccent),
          onTap: () => Utils.showSnackBar(context, 'Clicked Account info'),
        );
    Widget build(BuildContext context) => SimpleSettingsTile(
          title: 'Account Settings',
          subtitle: 'Privacy, Security, Language',
          leading:
              IconWidget(icon: Icons.person, color: Colors.lightGreenAccent),
          child: SettingsScreen(
            title: 'Account Settings',
            children: <Widget>[
              buildPrivacy(context),
              buildSecurity(context),
              buildAccountInfo(context),
              buildLanguage(),
              buildPassword(),
              buildLocation(),
            ],
          ),
        );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent.shade100,
          title: Text(
            'Account Settings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue.shade200,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SettingsGroup(title: 'Account Page', children: <Widget>[
                buildLocation(),
                SizedBox(
                  width: 15,
                  height: 15,
                ),
                buildLanguage(),
                SizedBox(
                  width: 15,
                  height: 15,
                ),
                buildPassword(),
                SizedBox(
                  height: 15,
                  width: 15,
                ),
                buildAccountInfo(context),
                SizedBox(
                  height: 15,
                  width: 15,
                ),
                buildSecurity(context),
                SizedBox(
                  height: 15,
                  width: 15,
                ),
                buildPrivacy(context),
                SizedBox(
                  height: 15,
                  width: 15,
                )
              ])
            ],
          ),
        )));
  }
}
