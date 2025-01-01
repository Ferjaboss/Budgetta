import 'package:flutter/cupertino.dart';

class Transaction {
  String title;
  String description;
  DateTime date;
  String amount;
  String type;
  IconData? icon;

  Transaction({required this.title, required this.description,required this.date, required this.amount, required this.type, this.icon});

  String formattedDate() {
    return '${date.day}/${date.month.toString()}/${date.year}';
  }
}