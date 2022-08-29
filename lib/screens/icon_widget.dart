import 'package:flutter/material.dart';

class IconWidget extends StatefulWidget {
  final IconData icon;
  final Color color;
  const IconWidget({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 32,
        backgroundColor: widget.color,
        child: Icon(
          widget.icon,
          color: Colors.white,
        ));
  }
}
