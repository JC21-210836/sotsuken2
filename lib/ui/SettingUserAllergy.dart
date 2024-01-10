import 'package:flutter/material.dart';
import '../Data/AllUserData.dart';
import 'Obligation_allergy.dart';

import 'package:sotsuken2/Data/AllAnotherData.dart';
import 'package:sotsuken2/Data/AllObligationData.dart';
import 'package:sotsuken2/Data/AllRecommendationData.dart';

import '../DB/Database.dart';

class StateSettingAllergy extends StatefulWidget{
  final String UserName;
  const StateSettingAllergy(this.UserName);

  @override
  State<StateSettingAllergy> createState(){
    return SettingAllergy();
  }
}

class SettingAllergy extends State<StateSettingAllergy>{

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
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    decoration:const BoxDecoration(
                      color: Colors.deepOrange,
                    ),
                    child: const Text('アレルゲンの変更',
                        style: TextStyle(
                            fontSize: 25,
                            color:Colors.white,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),

                  //表示義務
                  if(aod.getValueCheck().isNotEmpty)...[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 120, 0),
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
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(String gim in aod.getValueCheck())...[
                            Text('・$gim',
                              style:const TextStyle(
                                height: 1.5,
                                fontSize:25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ],
                      ),
                      //テキスト表示させるやつがいる
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
                          for(String sui in ard.getValueCheck2())...[
                            Text('・$sui',
                              style:const TextStyle(
                                height: 1.5,
                                fontSize:25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ],
                      ),
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
                      ),
                    ),
                  ],
                  Container(
                      width:230,
                      height:60,
                      margin:const EdgeInsets.fromLTRB(20, 0, 15, 7),
                      child:ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange
                          ),
                          child:const Text('変更',style:TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.white)),
                          onPressed:(){
                            aod.valueChangeBool1();
                            ard.valueChangeBool2();
                            aad.valueChangeBool3();
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return StateObligation_allergy(PageFlag: 'SettingUser');
                                })
                            ).then((value){
                              setState(() {});
                            });
                          }
                      )
                  ),
                  Container(
                      width:230,
                      height:60,
                      margin:const EdgeInsets.fromLTRB(15, 7, 15, 40),
                      child:OutlinedButton(
                          style:OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Colors.deepOrange
                            ),
                          ),
                          child:const Text('更新',style:TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.deepOrange)),
                          onPressed:(){
                            setState(() {
                              debugPrint('valueCheckのでーたないよう'+aod.getValueCheck().toString());
                              aod.valueChangeBool1();
                              ard.valueChangeBool2();
                              aad.valueChangeBool3();
                              _deletelist();//リスト表から前データを削除：追加した処理12/21
                              aod.HanteiObligation();
                              ard.HanteiRecommendation();
                              aad.HanteiAnother();
                            });
                            Future.delayed(const Duration(seconds: 1)).then((_){
                              aod.AllResetObligation();
                              ard.AllResetRecommendation();
                              aad.AllResetAnother();
                              Navigator.pop(context);
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
  //12/24追加処理
  final dbProvider = DBProvider.instance;

  //リスト表の削除
  void _deletelist() async {
    debugPrint('_deleteUserに来ました');
    final int userid = await dbProvider.selectUserId(widget.UserName);// ユーザーIDを非同期で取得
    debugPrint('deleteするuseridは：$useridです');
    final rowsDeleted = await dbProvider.deletelist(userid);
    debugPrint('削除しました $rowsDeleted');
    //insert処理を個々に追加してみる
    aod.insertHanteiObligation();//表示義務を再度追加：追加した処理12/21
    ard.insertHanteiRecommendation();//表示推奨を再度追加：追加した処理12/21
    aad.insertAllResetAnother();//追加成分を再度追加：追加した処理12/21
  }
}