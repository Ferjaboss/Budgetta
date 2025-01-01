import 'package:flutter/material.dart';
import 'package:budget_tracker/widgets/bottom_nav_menu.dart';
import 'package:budget_tracker/services/utils.dart';
class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallets',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'sf-display',
            )),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(Icons.settings, color: Colors.black), // Gear icon
            onPressed: () {
              // Handle the gear icon tap
              print("Settings tapped!");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Name
            Text(
              'Foulen Ben Foulen',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Spacer between lines
            // Wallet Count
            Text(
              'You have 2 wallets',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'sf-display',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Spacer between sections
            // Total Balance
            Text(
              'Total balance \$2,300.00',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16), // Spacer before Add Wallet button
            // Add Wallet Button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      showAddWalletDialog(context, (String p1) {});
                    },
                    child: const Text(
                      'Add Wallet',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16), // Spacer between button and wallets
            // Wallet Details
            const Text(
              'Cash',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '\$1,000.00 USD',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8), // Spacer between wallets
            const Text(
              'Savings',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '\$1,300.00 USD',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            // Push Show Summary to the bottom
            // Show Summary Button
            Center(
              child: TextButton(
                onPressed: () {
                  // Show Summary Button Functionality
                  print("Show Summary tapped!");
                },
                child: Text(
                  'Show summary',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavMenu(initialIndex: 3),
    );
  }
}
