import 'package:flutter/material.dart';
import 'package:sotsuken2/Data/AllAnotherData.dart';
import '../DB/Database.dart';
import 'CreateUserCheck.dart';
import 'Obligation_allergy.dart';
import 'Another_ingredient.dart';

import 'package:sotsuken2/Data/AllRecommendationData.dart';
import 'package:sotsuken2/Data/AllObligationData.dart';

class StateCreateUser2 extends StatefulWidget{
  final String sUserName;
  StateCreateUser2(this.sUserName);

  @override
  State<StateCreateUser2> createState(){
    return CreateUser2_Page();
  }
}

//String UserName = "";

class CreateUser2_Page extends State<StateCreateUser2> {

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
            child:SingleChildScrollView(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      margin:const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      padding:const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.indigo,
                          width: 1,
                        ),
                      ),
                      child:const Text('ユーザー登録',
                        style: TextStyle(
                            fontSize: 30,
                            color:Colors.indigo,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      child:Container(
                        width: 280,
                        height: 60,
                        margin: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color:Colors.blue
                              )
                          ),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width:60,
                              child:Icon(
                                Icons.account_box,
                                color: Colors.indigo,
                                size:50,
                              ),
                            ),
                            SizedBox(
                              width: 220,
                              child:Text(widget.sUserName,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        width:270,
                        height: 85,
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
                                  return const StateObligation_allergy(PageFlag : 'CreateUser');
                                })
                            );
                          },
                        )
                    ),
                    Container(
                      margin:const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: const FittedBox(
                        child: Text('表示義務・推奨のアレルゲンを\nお選びいただけます。',
                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                        width:270,
                        height: 85,
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
                          onPressed: (){
                            _selectAdd();
                            aad.setValueList3();
                            Future.delayed(const Duration(seconds: 1)).then((_){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context){
                                    return StateAnother_ingredient(PageFlag:'CreateUser', PageCount: 0);
                                  })
                              );
                            });
                          },
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
                              backgroundColor: Colors.indigo
                          ),
                          child:const Text('登録内容を確認',style: TextStyle(fontSize: 28)),
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return const StateCreateUserCheck();
                                })
                            );
                          },
                        )
                    )
                  ],
                )
            )
        )
    );
  }
  //追加した処理12/21
  final dbProvider = DBProvider.instance;

  //追加した処理12/24
  //追加成分表示テストメソッド
  void _selectAdd() async {
    debugPrint('_selectAddにきました');
    final List<String> hiragana = await dbProvider.selectAdd();//ひらがなslectメソッド結果
    final List<String> import = DBProvider.AddList;//import結果
    debugPrint('追加成分の内容:$hiragana');
    debugPrint('Addlistをimportした結果：$import');
    debugPrint(DBProvider.AddList.toString());
  }
}