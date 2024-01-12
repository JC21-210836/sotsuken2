import 'package:flutter/material.dart';
//ここにご利用方法のページ
import 'package:sotsuken2/ui/CreateUser1.dart';
import 'package:sotsuken2/ui/SettingUser1.dart';

class DrawerMenu extends StatelessWidget{
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
   return Drawer(
     child:ListView(
       children: [
         SizedBox(
           height: 100,
           child:DrawerHeader(
             child: Container(
               alignment: Alignment.bottomLeft,
               child:const Text('- Menu -',style: TextStyle(fontSize: 25),),
             ),


           ),
         ),

         //ご利用方法
         ListTile(
           leading: const Icon(
             Icons.import_contacts,
             color: Colors.black38,
             size:25,
           ),
           title:const Text('ご利用方法',style: TextStyle(fontSize: 20),),
           onTap:(){
             //まだない
           },
         ),
         //新規ユーザー登録
         ListTile(
           leading: const Icon(
             Icons.person_add,
             color: Colors.black38,
             size:25,
           ),
           title:const Text('ユーザー登録',style: TextStyle(fontSize: 20),),
           onTap:(){
             Navigator.of(context).pop();
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (context){
                   return const StateCreateUser1();
                 })
             );
           },
         ),
         //設定
         ListTile(
           leading: const Icon(
             Icons.settings,
             color: Colors.black38,
             size:25,
           ),
           title:const Text('設定',style: TextStyle(fontSize: 20),),
           onTap:(){
             Navigator.of(context).pop();
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (context){
                   return const StateUserSettings1();
                 })
             );
           },
         ),
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