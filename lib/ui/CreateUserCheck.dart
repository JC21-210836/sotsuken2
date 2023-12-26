import 'package:flutter/material.dart';
import 'package:sotsuken2/Data/AllAnotherData.dart';
import 'package:sotsuken2/Data/AllObligationData.dart';
import 'package:sotsuken2/Data/AllRecommendationData.dart';
import 'package:sotsuken2/Data/AllUserData.dart';

import '../DB/Database.dart';

class StateCreateUserCheck extends StatefulWidget{
  const StateCreateUserCheck({super.key});

  @override
  State<StateCreateUserCheck> createState(){
    return CreateUserCheck();
  }
}

class CreateUserCheck extends State<StateCreateUserCheck>{

  AllObligationData aod = AllObligationData();
  AllRecommendationData ard = AllRecommendationData();
  AllAnotherData aad = AllAnotherData();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text('成分チェッカー'),
      ),
      body:  Center(
        child:SingleChildScrollView(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  //表示義務
                  if(aod.getValueCheck().isNotEmpty)...[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 40, 120, 0),
                      decoration:BoxDecoration(
                          border:Border.all(color:Colors.red,width:1)
                      ),

                      child: Container(
                        margin:const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        padding:const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration:BoxDecoration(
                            border:Border.all(color:Colors.red,width:1)
                        ),
                        child:const Text('表示義務',
                            style:TextStyle(
                                fontSize:25,
                                fontWeight: FontWeight.bold,
                                color:Colors.deepOrange
                            )
                        ),
                      ),
                    ),
                    Container(
                      width: 280,
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 30),
                      padding:const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      decoration:BoxDecoration(
                          border:Border.all(color:Colors.red,width:1)
                      ),
                      //テキスト表示させるやつがいる↓

                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(String obligation in aod.getValueCheck())...[
                            Text('・$obligation',
                              style:const TextStyle(
                                height: 1.5,
                                fontSize:25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ],
                      )
                    ),
                  ],

                  //表示推奨
                  if(ard.getValueCheck2().isNotEmpty)...[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 120, 0),
                      decoration:BoxDecoration(
                          border:Border.all(color:Colors.blue,width:1)
                      ),
                      child:Container(
                        margin:const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        padding:const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration:BoxDecoration(
                            border:Border.all(color:Colors.blue,width:1)
                        ),
                        child:const Text('表示推奨',style:TextStyle(fontSize:25,fontWeight: FontWeight.bold,color:Colors.indigo)),
                      ),
                    ),
                    Container(
                      width: 280,
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 30),
                      padding:const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      decoration:BoxDecoration(
                          border:Border.all(color:Colors.blue,width:1)
                      ),
                      //テキスト表示させるやつがいる↓
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(String recommendation in ard.getValueCheck2())...[
                            Text('・$recommendation',
                              style:const TextStyle(
                                height: 1.5,
                                fontSize:25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ],
                      )
                    ),
                  ],

                  //追加成分
                  if(aad.getValueCheck3().isNotEmpty)...[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                      decoration:BoxDecoration(
                          border:Border.all(color:Colors.amber,width:1)
                      ),
                      child:Container(
                        margin:const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        padding:const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration:BoxDecoration(
                            border:Border.all(color:Colors.amber,width:1)
                        ),
                        child:const Text('その他の成分',style:TextStyle(fontSize:25,fontWeight: FontWeight.bold,color:Colors.orange)),
                      ),
                    ),
                    Container(
                      width: 280,
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 30),
                      padding:const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      decoration:BoxDecoration(
                          border:Border.all(color:Colors.amber,width:1)
                      ),
                      //テキスト表示させるやつがいる↓
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(String another in aad.getValueCheck3())...[
                            Text('・$another',
                              style:const TextStyle(
                                height: 1.5,
                                fontSize:25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ],
                      )
                    ),
                  ],

                  if(aod.getValueCheck().isEmpty && ard.getValueCheck2().isEmpty && aad.getValueCheck3().isEmpty)...[
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 50, 10, 80),
                      child:const Text('何も登録されていません',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
                    ),
                  ],

                  Container(
                      width:230,
                      height:60,
                      margin:const EdgeInsets.fromLTRB(15, 0, 15, 40),
                      child:ElevatedButton(
                          child:const Text('登録',style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
                          onPressed:(){
                            setState(() {
                              _insertUser();
                              _selectlistUser();
                              aod.insertHanteiObligation();//追加
                              ard.insertHanteiRecommendation();//追加
                              aad.insertAllResetAnother();//追加した処理12/21
                            });
                            //ユ－ザー選択画面(ChooseUser)
                            Future.delayed(const Duration(seconds: 1)).then((_){
                              Navigator.popUntil(context,ModalRoute.withName('ChooseUser_page'));
                              aod.AllResetObligation();
                              ard.AllResetRecommendation();
                            });
                          }
                      )
                  )
                ]
            )
        ),

      ),
    );
  }

  final dbProvider = DBProvider.instance;
  //ユーザの追加処理
  void _insertUser() async {
    AllUserData row = AllUserData.newAllUserData();
    row.username = AllUserData.sUserName;
    final username = await dbProvider.insertUser(row);
    print('ユーザ表にinsertしました: $username');
  }
  void _selectlistUser() async {
    debugPrint('_selectAllUserにきました');
    final result = await dbProvider.selectlistUser();
    debugPrint('userNameの中身$result');
  }
}