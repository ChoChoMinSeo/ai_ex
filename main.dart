import 'package:ai_ex/page/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Air',
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0x00f7c8e0).withOpacity(1),
      ),
      home: LoginPage(),
    );
  }
}
