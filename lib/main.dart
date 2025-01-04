import 'package:budget_tracker/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:budget_tracker/pages/first_time_welcome.dart';
import 'package:budget_tracker/pages/first_time_settings.dart';
import 'package:budget_tracker/pages/dashboard.dart';
import 'package:budget_tracker/pages/wallet_page.dart';
import 'package:budget_tracker/pages/statistics_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/profile.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileAdapter());
  await Hive.openBox<Profile>('profiles');
  runApp(MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: AppColors.customPink,
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/dashboard',
        routes: {
          '/': (context) => FirstPage(),
          '/first-settings': (context) => FirstSettings(),
          '/dashboard': (context) => Dashboard(),
          '/wallets': (context) => WalletPage(),
          '/profile': (context) => ProfilePage(),
          '/statistics': (context) => StatisticsPage(),
        }));
}
