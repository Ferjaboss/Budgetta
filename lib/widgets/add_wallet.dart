import 'package:flutter/material.dart';

class AddWallet extends StatefulWidget {
  final Function(String) onAdd;

  const AddWallet({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddWalletState createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add to Database'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter data...',
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