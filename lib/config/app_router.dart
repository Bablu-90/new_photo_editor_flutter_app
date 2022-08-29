import 'package:get/get.dart';
import 'package:new_photo_editor_flutter_app/screens/edit_photoview.dart';
import 'package:new_photo_editor_flutter_app/screens/home_screen.dart';
import 'package:new_photo_editor_flutter_app/screens/login_screen.dart';

class Routes {
  static final routes = [
    GetPage(name: '/login_screen', page: () => LoginScreen()),
    GetPage(name: '/home_screen', page: () => HomeScreen()),
    GetPage(name: '/edit_photoview', page: () => EditPhotoView()),
  ];
}
