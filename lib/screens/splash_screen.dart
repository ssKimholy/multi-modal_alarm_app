import 'package:alarm_app/screens/home_screen.dart';
import 'package:alarm_app/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    print('init home!!');
  }

  _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool loggedIn = false;
    if (prefs.containsKey('isLoggedIn')) {
      loggedIn = prefs.getBool('isLoggedIn') ?? false;
    }

    if (prefs.containsKey('isFixed')) {
      if (prefs.getBool('isFixed')!) {
        prefs.setBool('isFixed', false);
        // Navigator.pop(context);
        return;
      }
    }

    if (loggedIn) {
      print('home!');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
