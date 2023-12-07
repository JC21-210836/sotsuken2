import 'package:flutter/material.dart';

class StateSettingUser_NameChange extends StatefulWidget{
  final String UserName;
  const StateSettingUser_NameChange(this.UserName);

  @override
  State<StateSettingUser_NameChange> createState(){
    return SettingUser_NameChange();
  }
}

class SettingUser_NameChange extends State<StateSettingUser_NameChange> {
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
                      margin:const EdgeInsets.fromLTRB(0, 10, 0, 15),
                      padding:const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepOrange,
                          width: 1,
                        ),
                      ),
                      child:const Text('ユーザー名の変更',
                        style: TextStyle(
                            fontSize: 28,
                            color:Colors.deepOrange,
                            fontWeight: FontWeight.bold
                        ),
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
                                width: 150,
                                height: 70,
                                margin: const EdgeInsets.all(5),
                                alignment:Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Colors.deepOrangeAccent),
                                ),
                                child:const Text('現在の\nユーザー名',
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
                              height: 70,
                              margin: const EdgeInsets.all(5),
                              alignment:Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color:Colors.deepOrangeAccent),
                              ),
                              child:Text(widget.UserName,style: const TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                            ),
                          ),
                        ]
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child:const Text('新しいユーザー名を\n入力してください。',
                        style:TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 200,
                      margin: EdgeInsets.all(20),
                      child:const TextField(
                        maxLength: 7,
                        decoration: InputDecoration(
                          hintText: 'new Name',
                        ),
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepOrange)
                      ),
                      child:Container(
                        width: 170,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepOrange)
                        ),
                        margin: const EdgeInsets.all(3),
                        child:TextButton(
                          child:const Text('更新',
                            style: TextStyle(
                              fontSize: 25,
                              color:Colors.deepOrange,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          onPressed: (){},
                        ),
                      )
                    )

                  ]
              )
          )
      ),
    );
  }
}