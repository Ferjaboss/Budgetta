import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/profile.dart';

class AddProfileScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _balanceController,
              decoration: InputDecoration(labelText: 'Balance'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final name = _nameController.text;
                final balance = double.parse(_balanceController.text);
                final profile = Profile(name: name, balance: balance);
                final box = Hive.box<Profile>('profiles');
                await box.add(profile);
                Navigator.pop(context);
              },
              child: Text('Add Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
