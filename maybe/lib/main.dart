import 'package:flutter/material.dart';
import 'package:maybe/precentation/screens/chat/chat_screen.dart';
import 'package:maybe/theme/app_theme.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).theme(),
      title: 'Maybe Yes OR NOT',
      home: const ChatScreen()
     
    );
  }
}