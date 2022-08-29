import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  const ChipWidget({Key? key, required this.label, this.horizontalPadding = 0})
      : super(key: key);
  final Widget label;
  final double horizontalPadding;

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8 + widget.horizontalPadding,
      ),
      label: widget.label,
    );
  }
}
