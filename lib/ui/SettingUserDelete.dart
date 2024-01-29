import 'package:flutter/material.dart';

import '../DB/List.dart';
import '../DB/User.dart';

import '../Data/AllUserData.dart';
import '../component/AppbarComp.dart';

class StateSettingUserDelete extends StatefulWidget{
  final String UserName;

  StateSettingUserDelete(this.UserName);

  @override
  State<StateSettingUserDelete> createState(){
    return SettingUserDelete();
  }
}

class SettingUserDelete extends State<StateSettingUserDelete>{
  bool Agree = false;
  String UN = "";
  AllUserData aud = AllUserData(username: AllUserData.sUserName);

  @override
  Widget build(BuildContext context){
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
        appBar:AppbarComp(),
        body: Center(
          child:SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color:Colors.black12,
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: Offset(4,4)
                    )
                  ],
                ),
                child:Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  padding: const EdgeInsets.fromLTRB(10, 7, 0, 7),
                  child:  FittedBox(
                    child:RichText(
                      text:const TextSpan(
                          children: [
                            TextSpan(
                              text:'| ',
                              style: TextStyle(
                                  fontSize: 35,
                                  color:Colors.deepOrange,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            TextSpan(
                              text:'ユーザーの削除',
                              style: TextStyle(
                                  fontSize: 27,
                                  color:Colors.deepOrange,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ]
                      ),


                    ),
                  ),
                ),
              ),

              Container(
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

                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Container(
                          width: 310,
                          margin: const EdgeInsets.fromLTRB(10, 20, 10,0),
                          child:Transform.scale(
                              scale: 1.2,
                              child:CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title:Transform.translate(
                                    offset: const Offset(-20, 0),
                                    child:const FittedBox(
                                      child:Text('このユーザーを削除する',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  value: Agree,
                                  onChanged:(value) {
                                    setState(() {
                                      Agree = value!;
                                    });
                                  }
                              )

                          ),
                        ),

                        Container(
                          margin:const EdgeInsets.fromLTRB(10,10,10,0),
                          child:const Text('削除するユーザー名を\n入力してください',
                            style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin:const EdgeInsets.fromLTRB(10,10,10,10),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red)
                          ),
                          child:SizedBox(
                            width:200,
                            child:TextField (
                              style:const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                              maxLength: 7,
                              onChanged: (value){
                                UN = value;
                              },
                            ),
                          ),
                        ),
                        Container(
                            width: 200,
                            height:55,
                            margin: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                            child:ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ) ,
                                elevation: 7
                              ),
                              child:const Text('削除',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
                              onPressed: (){
                                setState(() {
                                  if(widget.UserName == UN && Agree == true){
                                    _deleteUser();
                                    //aud.deleteUserName(widget.UserName);
                                  }else{
                                    //エラーメッセが欲しいけど今出す場所ない
                                  }
                                });
                                //ユ－ザー選択画面(ChooseUser)
                                Future.delayed(const Duration(seconds: 1)).then((_){
                                  Navigator.popUntil(context,ModalRoute.withName('ChooseUser_page'));
                                });
                              },
                            )
                        ),
                      ]
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
  DBuser dbUser = DBuser();//DBクラスのインスタンス生成
  DBlist dbList = DBlist();//DBクラスのインスタンス生成
  //削除処理　変更1/09
  void _deleteUser() async {
    debugPrint('_deleteUserに来ました');
    //関連するデータの削除
    await dbList.Deletelist(widget.UserName);
    debugPrint('useridと一致するデータを削除を完了しました。');

    //ユーザの削除
    final rowsDeleted = await dbUser.deleteUser(widget.UserName);
    debugPrint('ユーザを削除しました $rowsDeleted');

    //現在残っているユーザの確認
    final result = await dbUser.selectlistUser();
    debugPrint('現在登録されているuserNameの中身$result');
  }

}