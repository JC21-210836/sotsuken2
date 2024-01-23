import 'package:flutter/material.dart';
import 'package:sotsuken2/Data/AllAnotherData.dart';
import 'package:sotsuken2/component/AppbarComp.dart';

import '../DB/Add.dart';
import '../DB/Food.dart';
import '../DB/List.dart';
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
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:[Colors.white,Color(0xFFFAAC90)],
        )
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppbarComp(),
        body: Center(
          child:Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color:Colors.black12,
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(7,7)
                  )
                ],
              ),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:const EdgeInsets.fromLTRB(0, 10, 0, 15),
                        padding:const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                              backgroundColor: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              elevation: 7
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
                              backgroundColor: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              elevation: 7
                          ),
                          child: const Text('アレルゲンの変更',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          onPressed: (){
                            //aod.AllResetObligation();
                            //ard.AllResetRecommendation();
                            _selectGimu();//追加した処理12/21
                            aad.setValueList3();
                            aod.setValueCheck(DBfood.Gimulist);
                            ard.setValueCheck2(DBfood.Suilist);
                            aad.setValueCheck3(DBadd.userAddList);

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
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              elevation: 7
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
                        child:ElevatedButton(
                          style:ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              elevation: 7
                          ),
                          child: const Text('ユーザー選択画面に\n戻る',
                            style: TextStyle(
                              color:Colors.white,
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
        ),
      ),
    );
  }

  //追加した処理12/21
  DBlist dbList = DBlist();//DBクラスのインスタンス生成
  DBfood dbFood = DBfood();//DBクラスのインスタンス生成
  DBadd dbAdd = DBadd();//DBクラスのインスタンス生成
  void _selectGimu() async {
    debugPrint('_selectGimuにきました');
    final int userid = await dbList.selectUserId(widget.UserName);
    debugPrint('これから調べるユーザはuserid：$useridです');
    await dbFood.selectGimu(userid);//表示義務
    await dbFood.selectSui(userid);//表示推奨
    //await dbProvider.selectAdd();
    await dbAdd.selectUserADD(userid);//←ここついかした

  }
}