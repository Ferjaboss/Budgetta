import 'package:flutter/material.dart';
import 'package:budget_tracker/widgets/fade_route.dart';

import '../pages/dashboard.dart';
import '../pages/profile.dart';
import '../pages/statistics_page.dart';
import '../pages/wallet_page.dart';

class BottomNavMenu extends StatefulWidget {
  final int initialIndex;

  const BottomNavMenu({super.key, this.initialIndex = 0});

  @override
  _BottomNavMenuState createState() => _BottomNavMenuState();
}

class _BottomNavMenuState extends State<BottomNavMenu> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _showAddModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height:240,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('Add Income'),
                onTap: () {
                  // Handle add income action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.money_off),
                title: Text('Add Expense'),
                onTap: () {
                  // Handle add expense action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  // Handle camera action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Picture'),
                onTap: () {
                  // Handle picture action
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      FocusScope.of(context).unfocus();
      _showAddModal(context);
    } else if (index == _selectedIndex) {
      return;
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }

    Widget page;
    switch (index) {
      case 0:
        page = Dashboard();
        break;
      case 1:
        page = StatisticsPage();
        break;
      case 3:
        page = WalletPage();
        break;
      case 4:
        page = ProfilePage();
        break;
      default:
        return;
    }
    Navigator.of(context).push(FadeRoute(page: page));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Statistics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,
              size: 60, color: Theme.of(context).primaryColor),
          label: (''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
