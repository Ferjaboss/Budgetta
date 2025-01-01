import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  final Function(String) onAdd;

  const AddUser({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
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
          onPressed: () {
            widget.onAdd(_controller.text);
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}