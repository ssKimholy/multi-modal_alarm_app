import 'package:alarm_app/screens/onboarding_screen.dart';
import 'package:alarm_app/utils/global_var.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => GlobalVar(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AlarmApp Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // 영어
        Locale('ko', ''), // 한국어
        // 필요한 다른 로케일을 여기에 추가
      ],
      home: OnboardingScreen(),
    );
  }
}
