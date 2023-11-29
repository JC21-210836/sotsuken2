import 'package:flutter/material.dart';

import 'Obligation_allergy.dart';
import 'ChooseUser.dart';

import 'package:sotsuken2/Data/AllUserData.dart';

class StateCreateUser2 extends StatefulWidget{
  const StateCreateUser2({super.key});

  @override
  State<StateCreateUser2> createState(){
    return CreateUser2_Page();
  }
}

String UserName = "";

class CreateUser2_Page extends State<StateCreateUser2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('成分チェッカー'),
        ),
        body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                  margin:const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  padding:const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.indigo,
                      width: 1,
                    ),
                  ),
                  child:const Text('ユーザー登録',
                    style: TextStyle(
                        fontSize: 35,
                        color:Colors.indigo,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                /*
              Container(
                margin:const EdgeInsets.all(10),
                child:const Text('下記情報を登録してください',
                    style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                ),
              ),

               */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child:const Text('ユーザー名：',style: TextStyle(fontSize: 25),),
                    ),
                    Container(
                      padding:const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text(UserName,style: const TextStyle(fontSize: 30),),
                    ),
                  ],
                ),
                Container(
                    width:270,
                    height: 90,
                    margin: const EdgeInsets.all(10),
                    child:OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color:Colors.blue
                          )
                      ),
                      child:const Text('アレルゲンの選択\n(テンプレート)',
                        style: TextStyle(fontSize: 25,color:Colors.indigo,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return CheckBoxT(PageFlag : 1);
                          })
                        );
                      },
                    )
                ),
                Container(
                  margin:const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child:const Text('表示義務・推奨のアレルゲンを\nお選びいただけます。',
                    style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                    width:270,
                    height: 90,
                    margin: const EdgeInsets.all(10),
                    child:OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color:Colors.blue
                          )
                      ),
                      child:const Text('その他の成分を\n新規追加',
                        style: TextStyle(fontSize: 25,color:Colors.indigo,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: (){},
                    )
                ),
                Container(
                  margin:const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child:const Text('テンプレート外の成分を\nご登録いただけます。',
                    style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                    width: 280,
                    height:60,
                    padding:const EdgeInsets.all(5),
                    child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.indigo
                      ),
                      child:const Text('登録内容を確認',style: TextStyle(fontSize: 28)),
                      onPressed: (){
                        AllUserData aud = AllUserData();
                        setState(() {
                          aud.setUserNameFinal();
                        });
                        Navigator.pop(context);
                        Navigator.of(context).pop();
                      },
                    )
                )
              ],
            )

        )
    );
  }
}