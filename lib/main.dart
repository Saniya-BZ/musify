import 'package:flutter/material.dart';
import 'package:musify/models/playlist.dart';
import 'package:provider/provider.dart';
import 'view/home_screen.dart';
import 'themes/theme_provider.dart';


void main(){
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create : (context)=> ThemeProvider()),
        ChangeNotifierProvider(create : (context)=> PlayListProvider())
      ],
      child: const MainScreen(),
    ),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const  HomeScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}