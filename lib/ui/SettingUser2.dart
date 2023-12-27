import 'package:flutter/material.dart';
import 'package:sotsuken2/Data/AllAnotherData.dart';

import '../DB/Database.dart';
import 'SettingUserNameChange.dart';
import 'SettingUserDelete.dart';
import 'SettingUserAllergy.dart';

import 'package:sotsuken2/Data/AllRecommendationData.dart';
import 'package:sotsuken2/Data/AllObligationData.dart';

class StateUserSettings2 extends StatefulWidget{
  final String UserName;
  const StateUserSettings2(this.UserName);

  @override
  State<StateUserSettings2> createState(){
    return UserSettings2();
  }
}

class UserSettings2 extends State<StateUserSettings2> {

  AllObligationData aod = AllObligationData();
  AllRecommendationData ard = AllRecommendationData();
  AllAnotherData aad = AllAnotherData();

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
                      padding:const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepOrange,
                          width: 1,
                        ),
                      ),
                      child:const Text('ユーザー設定',
                        style: TextStyle(
                            fontSize: 30,
                            color:Colors.deepOrange,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 60,
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color:Colors.deepOrangeAccent
                            )
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width:60,
                            child: Icon(
                              Icons.account_box,
                              color: Colors.redAccent,
                              size:50,
                            ),
                          ),
                          SizedBox(
                            width: 220,
                            child:Text(widget.UserName,style: const TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                          )
                        ],
                      ),
                    ),


                    Container(
                      width:270,
                      height:50,
                      margin: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent
                        ),
                        child: const Text('ユーザー名の変更',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context){
                                return StateSettingUserNameChange(widget.UserName);
                              })
                          );
                        },
                      ),

                    ),
                    Container(
                      width:270,
                      height:50,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent
                        ),
                        child: const Text('アレルゲンの変更',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        onPressed: (){
                          //aod.AllResetObligation();
                          //ard.AllResetRecommendation();
                          _selectGimu();//追加した処理12/21
                          aod.setValueCheck(DBProvider.Gimulist);
                          ard.setValueCheck2(DBProvider.Suilist);
                          aad.setValueCheck3(DBProvider.AddList);
                          Future.delayed(const Duration(seconds: 1)).then((_){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return StateSettingAllergy(widget.UserName);
                                })
                            );
                          });
                        },
                      ),

                    ),
                    Container(
                      width:270,
                      height:50,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                        ),
                        child: const Text('ユーザーの削除',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context){
                                return StateSettingUserDelete(widget.UserName);
                              })
                          );
                        },
                      ),

                    ),

                    Container(
                      width:290,
                      height:90,
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 25),
                      child:OutlinedButton(
                        style:OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.deepOrange
                          ),
                        ),
                        child: const Text('ユーザー選択画面に\n戻る',
                          style: TextStyle(
                            color:Colors.deepOrange,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),

                    ),
                  ]
              )
          )
      ),
    );
  }
  //追加した処理12/21
  final dbProvider = DBProvider.instance;
  void _selectGimu() async {
    debugPrint('_selectGimuにきました');
    final int userid = await dbProvider.selectUserId(widget.UserName);
    await dbProvider.selectGimu(userid);//表示義務
    await dbProvider.selectSui(userid);//表示推奨
    await dbProvider.selectUserADD(userid);
  }
}