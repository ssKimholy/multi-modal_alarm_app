import 'package:alarm_app/screens/alarm_page_screen.dart';
import 'package:alarm_app/screens/friends_screen.dart';
import 'package:alarm_app/screens/history_screen.dart';
import 'package:alarm_app/utils/global_var.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    AlarmPageScreen(),
    const FriendScreen(),
    const HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalVar>(context);

    return IndexedStack(
      index: global.getIndex,
      children: _pages,
    );
  }
}
