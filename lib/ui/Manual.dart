import 'package:flutter/material.dart';

class Manual_Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('ご利用方法について'),
      ),
      body: Center(
        child:SingleChildScrollView(
          child:Column(
            children: [
              Container(
                child:const Text('ご利用方法',style: TextStyle(fontSize: 20),),
              ),
              Container(
                child: const Text('なんかかくとこ'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
