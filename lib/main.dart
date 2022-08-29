import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:new_photo_editor_flutter_app/screens/header_page.dart';
import 'package:new_photo_editor_flutter_app/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Settings.getValue<bool>(HeaderPage.keyDarkMode, true);
    return ValueChangeObserver(
      cacheKey: HeaderPage.keyDarkMode,
      defaultValue: true,
      builder: (_, isDarkMode, tr) => GetMaterialApp(
        /*getPages: [
          GetPage(name: '/login_screen', page: () => LoginScreen()),
          GetPage(name: '/home_screen', page: () => SplashScreen()),
          GetPage(
              name: '/edit_photo_view_screen',
              page: () => const EditPhotoView()),
        ],*/
        debugShowCheckedModeBanner: false,
        title: 'Ritik Edixx',
        theme: isDarkMode != null
            ? ThemeData.dark().copyWith(
                primaryColor: Colors.tealAccent,
                accentColor: Colors.white54,
                scaffoldBackgroundColor: Color(0xFF170639),
                canvasColor: Color(0xFF170635),
              )
            : ThemeData.light().copyWith(
                accentColor: Colors.black,
              ),
        home: SplashScreen(),
      ),
    );
  }
}
