import 'package:flutter/material.dart';
import '../view/settings.dart';


class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            DrawerHeader(child:
            Center(
              child: Icon(Icons.music_note,size: 40,
                  color: Theme.of(context).colorScheme.inversePrimary),

            )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,top: 25),
              child: ListTile(
                title: const Text("H O M E"),
                leading: const Icon(Icons.home),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 0),
              child: ListTile(
                title:const Text("S E T T I N G S"),
                leading: const Icon(Icons.settings),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingPage()));
                },
              ),
            ),
            const Text("HELLOOOOO")

          ],
        )
    );
  }
}