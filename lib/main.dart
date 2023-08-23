import 'package:flutter/material.dart';
import 'package:home_clean_worker_dashboard/pages/account/edit_profile.dart';
import 'package:home_clean_worker_dashboard/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const EditProfile(),
    );
  }
}