import 'package:flutter/material.dart';

class StateUserSettings2 extends StatefulWidget{
  final String UserName;
  const StateUserSettings2(this.UserName);

  @override
  State<StateUserSettings2> createState(){
    return UserSettings2();
  }
}

class UserSettings2 extends State<StateUserSettings2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('成分チェッカー'),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:const EdgeInsets.fromLTRB(0, 10, 0, 25),
                      padding:const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepOrange,
                          width: 1,
                        ),
                      ),
                      child:const Text('ユーザー設定',
                        style: TextStyle(
                            fontSize: 35,
                            color:Colors.deepOrange,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      margin:const EdgeInsets.all(20),
                      child:const Text('登録内容を変更する項目を\n選択してください',
                        style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color:Colors.deepOrangeAccent),
                            ),
                            child:Container(
                                width: 170,
                                height: 80,
                                margin: const EdgeInsets.all(5),
                                alignment:Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Colors.deepOrangeAccent),
                                ),
                                child:const Text('選択されている\nユーザー',
                                  style:TextStyle(
                                      fontSize:23,
                                      color:Colors.deepOrange,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                )
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color:Colors.deepOrangeAccent),
                            ),
                            child:Container(
                              width: 140,
                              height: 80,
                              margin: const EdgeInsets.all(5),
                              alignment:Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color:Colors.deepOrangeAccent),
                              ),
                              child:Text(widget.UserName,style: const TextStyle(fontSize: 28),textAlign: TextAlign.center,),
                            ),
                          ),
                        ]
                    ),

                    Container(
                      width:270,
                      height:60,
                      margin: EdgeInsets.fromLTRB(20, 25, 20, 25),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange
                        ),
                        child: const Text('ユーザー名の変更',style: TextStyle(fontSize: 28),),
                        onPressed: (){},
                      ),

                    ),
                  ]
              )
          )
      ),
    );
  }
}