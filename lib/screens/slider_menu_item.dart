import 'package:flutter/material.dart';

class SliderMenuItem extends StatefulWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  State<SliderMenuItem> createState() => _SliderMenuItemState();
}

class _SliderMenuItemState extends State<SliderMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Icon(widget.iconData, color: Colors.black),
        onTap: () => widget.onTap?.call(widget.title));
  }
}
