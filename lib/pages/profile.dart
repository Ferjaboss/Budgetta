import 'package:flutter/material.dart';
import 'package:budget_tracker/services/utils.dart';
import '../widgets/bottom_nav_menu.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, dynamic>> _profiles = [
    {'name': 'John Doe', 'balance': 1500.00},
    {'name': 'Jane Smith', 'balance': 2300.00},
    {'name': 'Alice Johnson', 'balance': 3200.00},
  ];

  void _deleteProfile(int index) {
    setState(() {
      _profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles', style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'sf-display',)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              showAddUserDialog(context, (String name) {
                setState(() {
                  _profiles.add({'name': name, 'balance': 0.00});
                });
              });
              print('Add profile tapped!');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _profiles.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_profiles[index]['name']),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _deleteProfile(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${_profiles[index]['name']} deleted')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text(_profiles[index]['name']),
              subtitle: Text('Total balance: \$${_profiles[index]['balance']}'),
              trailing: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  // Handle settings button tap
                  print("Settings tapped for ${_profiles[index]['name']}!");
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavMenu(initialIndex: 4),
    );
  }
}