import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {super.key, required this.text, required this.icon, this.onTapFunction});

  final String text;
  final IconData icon;
  final dynamic onTapFunction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      onTap: () {
        onTapFunction();
      },
    );
  }
}
