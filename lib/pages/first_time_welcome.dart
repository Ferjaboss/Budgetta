import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 58, left: 20, right: 20),
              child: Image(image: AssetImage('assets/images/Logo.png')),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Text(
                'Manage your Spending With BUDGETTA',
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'sf-text',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.pop(context);
                 Navigator.pushNamed(context, '/first-settings');
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'sf-text',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  // Add some space between the text and the icon
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
