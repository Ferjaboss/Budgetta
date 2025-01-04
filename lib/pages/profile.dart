import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/profile.dart';
import '../widgets/add_profile.dart';
import '../widgets/bottom_nav_menu.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Box<Profile> _profileBox;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    _profileBox = await Hive.openBox<Profile>('profiles');
    setState(() {});
  }

  void _deleteProfile(int index) {
    setState(() {
      _profileBox.deleteAt(index);
    });
  }

  void _showAddProfileDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddProfile(
          onAdd: (String name) {
            setState(() {});
          },
        );
      },
    );
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
            onPressed: _showAddProfileDialog,
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: _profileBox.listenable(),
        builder: (context, Box<Profile> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No profiles added.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final profile = box.getAt(index);
              return Dismissible(
                key: Key(profile!.name),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  _deleteProfile(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${profile.name} deleted')),
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: ListTile(
                  title: Text(profile.name),
                  subtitle: Text('Total balance: \$${profile.balance}'),
                  trailing: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      // Handle settings button tap
                      print("Settings tapped for ${profile.name}!");
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavMenu(initialIndex: 4),
    );
  }
}