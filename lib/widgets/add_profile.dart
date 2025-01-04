import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/profile.dart';

class AddProfile extends StatefulWidget {
  final Function(String) onAdd;

  const AddProfile({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New User'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter user name...',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            final name = _controller.text;
            if (name.isNotEmpty) {
              final profile = Profile(name: name, balance: 0.0);
              final box = await Hive.openBox<Profile>('profiles');
              await box.add(profile);
              widget.onAdd(name);
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}