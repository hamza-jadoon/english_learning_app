import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsCategory extends StatelessWidget {
  final String title;

  SettingsCategory({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
      },
    );
  }
}