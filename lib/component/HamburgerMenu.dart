import 'package:flutter/material.dart';
import 'package:sotsuken2/ui/SettingUser1.dart';

class DrawerMenu extends StatelessWidget{
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
   return Drawer(
     child:ListView(
       children: [
         const DrawerHeader(
             child:Text('Menu'),
         ),
         ListTile(
             title:const Text('設定',style: TextStyle(fontSize: 20),),
           onTap:(){
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (context){
                   return const StateUserSettings1();
                 })
             );
           },
         ),
         ListTile(title:Text('b')),
         ListTile(title:Text('c')),
       ],
     )
   );
  }

}
/*
Navigator.of(context).push(
  MaterialPageRoute(builder: (context){
    return StateUserSettings1();
  })
);

 */