import 'package:budget_tracker/widgets/add_wallet.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/widgets/add_profile.dart';


void showAddWalletDialog(BuildContext context, Function(String) onAdd) {
  showDialog(
    context: context,
    builder: (context) => AddWallet(onAdd: onAdd),
  );
}

void showAddUserDialog(BuildContext context, Function(String) onAdd) {
  showDialog(
    context: context,
    builder: (context) => AddProfile(onAdd: onAdd),
  );
}