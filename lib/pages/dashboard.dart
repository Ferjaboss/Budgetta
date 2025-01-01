import 'package:budget_tracker/widgets/bottom_nav_menu.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/models/Transaction.dart';
import 'package:budget_tracker/widgets/transaction.dart';
import 'package:budget_tracker/widgets/topup_btn.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:budget_tracker/services/utils.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Transaction> transactions = [
    Transaction(
      title: 'Groceries',
      description: 'Bought groceries for the week',
      date: DateTime.now(),
      amount: '50.00',
      type: 'expense',
      icon: Icons.shopping_cart,
    ),
    Transaction(
      title: 'Salary',
      description: 'Received salary for the month',
      date: DateTime.now(),
      amount: '500.00',
      type: 'income',
      icon: Icons.money,
    ),
    Transaction(
      title: 'Electricity Bill',
      description: 'Paid electricity bill for the month',
      date: DateTime.now(),
      amount: '100.00',
      type: 'expense',
      icon: Icons.flash_on,
    ),
  ];

  var user = {
    'name': 'John Doe',
    'totalIncome': '500.00',
    'currency': '\$',
  };

  var Wallets = [
    {
      'name': 'Cash',
      'balance': '500.00',
      'currency': '\$',
    },
    {
      'name': 'Bank',
      'balance': '1000.00',
      'currency': '\$',
    },
    {
      'name': 'Savings',
      'balance': '2000.00',
      'currency': '\$',
    },
  ];

  bool isVisible = true;

  void hide() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/images/svgs/clip.svg',
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hello , ${user['name']} ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'sf-display'),
                          ),
                          Icon(Icons.notifications_none, color: Colors.white),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Balance',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      isVisible
                                          ? '${user['currency']} ${user['totalIncome']}'
                                          : '${user['currency']} ****',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      icon: isVisible
                                          ? Icon(Icons.visibility,
                                              color: Colors.grey)
                                          : Icon(Icons.visibility_off,
                                              color: Colors.grey),
                                      onPressed: () {
                                        hide();
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print("Top Up Clicked");
                                      },
                                      child: Topupbtn(
                                          icon: Icons.arrow_upward,
                                          label: 'Top Up'),
                                    ),
                                    Topupbtn(
                                        icon: Icons.account_balance_wallet,
                                        label: 'Withdraw'),
                                    Topupbtn(
                                        icon: Icons.send, label: 'Transfer'),
                                    Topupbtn(
                                        icon: Icons.refresh, label: 'History'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8,left: 16 ,bottom: 4),
                child: Text(
                  "Wallets",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'sf-display',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
          // Create a Horizontal ListView for the wallets here
          Container(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 3.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    onPressed: () {
                      showAddWalletDialog(context, (String p1) {});
                      print('Add Wallet tapped!');
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ...Wallets.map((wallet) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              wallet['name']!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'sf-display'),
                            ),
                            Text(
                              '${wallet['currency']} ${wallet['balance']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'sf-display'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          // Create a ListView for the transactions here

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8,left: 16 ,bottom: 4),
                child: Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'sf-display',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: transactions.map((transaction) {
                return TransactionWidget(
                  transaction: transaction,
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavMenu(initialIndex: 0,),
    );
  }
}
