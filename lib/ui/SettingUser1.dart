import 'package:flutter/material.dart';

import 'ChooseUser.dart';
import 'SettingUser2.dart';
import 'package:sotsuken2/Data/AllUserData.dart';

class StateUserSettings1 extends StatefulWidget{
  const StateUserSettings1({super.key});

  @override
  State<StateUserSettings1> createState(){
    return UserSettings1();
  }
}

class UserSettings1 extends State<StateUserSettings1>{

  void PageRoute(String name) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return StateUserSettings2(name);
        })
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('成分チェッカー'),
      ),
      body: Center(
          child:SingleChildScrollView(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
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
                    child:const Text('登録内容を変更する\nユーザーを選択してください',
                      style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color:Colors.deepOrange)
                    ),
                    child:Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:Colors.deepOrange)
                      ),
                      child:Column(
                        children: [
                          //child:Text(allUserName,style:const TextStyle(fontSize: 20,)),
                          //ボタン×５
                          Container(
                            width: 240,
                            height: 50,
                            margin: const EdgeInsets.all(2),
                            child:OutlinedButton(
                              style:OutlinedButton.styleFrom(
                                  side:const BorderSide(
                                      color: Colors.deepOrangeAccent
                                  )
                              ),
                              child:Text(valueName1,style:const TextStyle(fontSize: 25,color:Colors.black87)),
                              onPressed: (){
                                PageRoute(valueName1);
                              },
                            ),
                          ),
                          Container(
                            width: 240,
                            height: 50,
                            margin: const EdgeInsets.all(2),
                            child:OutlinedButton(
                              style:OutlinedButton.styleFrom(
                                  side:const BorderSide(
                                      color: Colors.deepOrangeAccent
                                  )
                              ),
                              child:Text(valueName2,style:const TextStyle(fontSize: 25,color:Colors.black87)),
                              onPressed: (){},
                            ),
                          ),
                          Container(
                            width: 240,
                            height: 50,
                            margin: const EdgeInsets.all(2),
                            child:OutlinedButton(
                              style:OutlinedButton.styleFrom(
                                  side:const BorderSide(
                                      color: Colors.deepOrangeAccent
                                  )
                              ),
                              child:Text(valueName3,style:const TextStyle(fontSize: 25,color:Colors.black87)),
                              onPressed: (){},
                            ),
                          ),
                          Container(
                            width: 240,
                            height: 50,
                            margin: const EdgeInsets.all(2),
                            child:OutlinedButton(
                              style:OutlinedButton.styleFrom(
                                  side:const BorderSide(
                                      color: Colors.deepOrangeAccent
                                  )
                              ),
                              child:Text(valueName4,style:const TextStyle(fontSize: 25,color:Colors.black87)),
                              onPressed: (){},
                            ),
                          ),
                          Container(
                            width: 240,
                            height: 50,
                            margin: const EdgeInsets.all(2),
                            child:OutlinedButton(
                              style:OutlinedButton.styleFrom(
                                  side:const BorderSide(
                                      color: Colors.deepOrangeAccent
                                  )
                              ),
                              child:Text(valueName5,style:const TextStyle(fontSize: 25,color:Colors.black87)),
                              onPressed: (){},
                            ),
                          ),

                        ],
                      ),

                    ),
                  ),

                ]
            ),
          )

      ),
    );
  }

}



bool NullHantei(){
  return true;
}
