
import 'package:flutter/cupertino.dart';
import 'package:musify/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S E T T I N G S"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(25),
        child: Row(
          children: [
            const Text("Dark mode", style: TextStyle(fontWeight: FontWeight.bold),),
            CupertinoSwitch(value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode, onChanged: (value)=>
                Provider.of<ThemeProvider>(context, listen:false).toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}