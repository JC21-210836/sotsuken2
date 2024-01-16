import 'package:flutter/material.dart';

//追加成分登録についてのページ用
class ManualDeleteUser_Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const  Text('ご利用方法について'),
      ),
      body: Center(
        child:SingleChildScrollView(
          child:Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange),
                ),
                child:Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange),
                  ),
                  child:const Text('ユーザーの削除について',
                    style: TextStyle(fontSize: 25,color: Colors.deepOrange,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: const Text('まだなんもないよ',style: TextStyle(fontSize: 20),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
