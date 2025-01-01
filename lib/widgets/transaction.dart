import 'package:flutter/material.dart';
import 'package:budget_tracker/models/Transaction.dart';

class TransactionWidget extends StatelessWidget {
  late Transaction transaction;

  TransactionWidget({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.redAccent.shade100,
              radius: 24,
              child: transaction.type == 'expense'
                  ? Icon(Icons.arrow_downward_rounded, color: Colors.white)
                  : Icon(Icons.arrow_upward_rounded, color: Colors.white),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transaction.title,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(transaction.description,
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            if (transaction.type == 'expense')
              Text(transaction.amount,
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            if (transaction.type == 'income')
              Text(transaction.amount,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
