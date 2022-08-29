import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_photo_editor_flutter_app/screens/account_page.dart';
import 'package:new_photo_editor_flutter_app/screens/chip_widget.dart';
import 'package:new_photo_editor_flutter_app/screens/edit_photoview.dart';
import 'package:new_photo_editor_flutter_app/screens/grid_child.dart';
import 'package:new_photo_editor_flutter_app/screens/header_page.dart';
import 'package:new_photo_editor_flutter_app/screens/slider_menu.dart';

class HomeScreen extends StatefulWidget {
  String email;
  HomeScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 50,
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                border: Border(right: BorderSide(width: 15.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/ritik.png")),
              ),
            ),
          ),
        ],
        title: Text(
          "Ritik Edixx",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.black,
      ),
      drawer: SliderMenu(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ImagePicker imagePicker = ImagePicker();
          imagePicker.pickImage(
            source: ImageSource.camera,
            maxWidth: 30,
            maxHeight: 30,
          );
        },
        icon: const Icon(Icons.camera_alt),
        label: const Text("Take a Photo"),
        backgroundColor: Colors.indigoAccent.shade100,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurpleAccent,
        buttonBackgroundColor: Colors.lightBlue.shade600,
        items: <Widget>[
          Icon(Icons.photo, color: Colors.grey, size: 30),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HeaderPage();
              }));
            },
            icon: Icon(Icons.dark_mode, color: Colors.red, size: 32),
          ),
          Icon(Icons.home_outlined, color: Colors.cyanAccent, size: 32),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return EditPhotoView();
              }));
            },
            icon: Icon(
              Icons.edit_sharp,
              color: Colors.black,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AccountPage();
              }));
            },
            icon: (Icon(Icons.settings_applications_sharp,
                color: Colors.redAccent, size: 32)),
          ),
        ],
        color: Colors.blue.shade200,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.lightBlueAccent,
        ),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Text("My Albums", style: TextStyle()),
                  Spacer(),
                  ChipWidget(
                      label: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.black,
                      backgroundColor: Colors.lightBlueAccent,
                      decorationColor: Colors.indigo,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 16,
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 16,
                crossAxisSpacing: 25,
                children: const [
                  GridChild(
                    imagePath: 'assets/images/photo.png',
                    count: 32,
                    description: 'My Pic',
                  ),
                  GridChild(
                    imagePath: 'assets/images/camera.png',
                    count: 42,
                    description: 'My Camera',
                  ),
                  GridChild(
                    imagePath: 'assets/images/pixel.png',
                    count: 72,
                    description: 'Pixel',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
