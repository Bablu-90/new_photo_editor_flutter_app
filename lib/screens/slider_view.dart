import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:new_photo_editor_flutter_app/screens/slider_menu.dart';

class SliderView extends StatefulWidget {
  const SliderView(
      {Key? key, required Null Function(dynamic title) onItemClick})
      : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  late String title;

  @override
  void initState() {
    title = "Home";
    super.initState();
  }

  @override
  void dispose() {
    /*_key.closeDrawer();
    _key.openDrawer();
    _key.toggle();
    _key.isDrawerOpen();*/
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      body: SliderDrawer(
        key: GlobalKey(),
        appBar: SliderAppBar(
          appBarColor: Colors.deepPurpleAccent,
          title: Text(
            'Welcome Ritik',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        slider: SliderView(onItemClick: (title) {
          _key.currentState!.closeSlider();
          setState(() {
            this.title = title;
          });
        }),
        child: SliderMenu(),
        isDraggable: true,
        animationDuration: 400,
        sliderOpenSize: 265,
        sliderCloseSize: 0,
        splashColor: Colors.blueAccent,
        slideDirection: SlideDirection.LEFT_TO_RIGHT,
      ),
    );
  }
}
