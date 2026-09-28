import 'package:flutter/material.dart';
import 'package:maybe/precentation/providers/chat_providers.dart';
import 'package:maybe/precentation/screens/chat/chat_screen.dart';
import 'package:maybe/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      //chat provider a nivel global
      // para que cada wigwt peuda acceder y consultar la informacion de opendevtools
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProviders()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        title: 'Maybe Yes OR NOT',
        home: const ChatScreen()
       
      ),
    );
  }
}