import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(''),
        ),
        title: Text('User Name'),
        subtitle: Text('user@example.com'),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (builder) => ProfileScreen()));
          },
        ),
      ),
    );
  }
}