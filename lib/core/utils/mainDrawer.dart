import 'package:flutter/material.dart';

class mainDrawer extends StatefulWidget {
  const mainDrawer({Key? key}) : super(key: key);

  @override
  State<mainDrawer> createState() => _mainDrawerState();
}

class _mainDrawerState extends State<mainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(
        children: [],
      )),
    );
  }
}
