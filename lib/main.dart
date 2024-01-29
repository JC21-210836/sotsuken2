import 'package:flutter/material.dart';

import 'DB/Add.dart';
import 'DB/User.dart';

import 'ui/SettingUser1.dart';
import 'ui/ChooseUser.dart';
import 'ui/Manual.dart';
import 'Data/AllAnotherData.dart';
import 'component/AppbarComp.dart';
import 'component/BottomNavbarComp.dart';


void main() {
  runApp(const MyApp());    //const無くても動く(下とセット)
}

class MyApp extends StatelessWidget{
  const MyApp({super.key}); //無くても動く(上とセット)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title:'成分チェッカー',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        routes: {
          'ChooseUser_page':(context){
            return const StateChooseUser();
          },
          'SettingUser_page':(context){
            return const StateUserSettings1();
          },
        },
        home:Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:[Colors.white,Color(0xFF90D4FA)],
            )
          ),
          child:Home_Page_State(),
        ),
    );
  }
}

class Home_Page_State extends StatefulWidget{
  State<Home_Page_State> createState(){
    return Home_Page();
  }
}

class Home_Page extends State<Home_Page_State>{
  AllAnotherData aad = AllAnotherData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppbarComp(),
      bottomNavigationBar: const BottomNavbarCompState(flagName: 'main', text: 'まずは、ご利用になる品目を選択してください。'),
      body: Center(

        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Container(
                width: 300,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30,30,30,15),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1,
                          ),
                        ),
                        child:Container(
                            margin: const EdgeInsets.fromLTRB(10,10,10,10),
                            padding: const EdgeInsets.fromLTRB(25,15,25,15),
                            decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.indigo,
                                width: 1,
                              ),
                            ),
                            child: const FittedBox(
                              child: Text('成分チェッカー',
                                style: TextStyle(
                                    fontSize: 27,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 170,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black26,width: 3)
                            ),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Colors.white,
                                elevation:7
                              ),
                               child:Column(
                                children: [
                                   Container(
                                     margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                     height: 113,
                                     child:Image.asset(
                                       'images/milk.png',
                                       fit: BoxFit.fitWidth,
                                     ),
                                   ),
                                  const Text('食品',
                                    style: TextStyle(
                                        fontSize: 27,color: Colors.indigo,
                                    ),
                                  )
                                ],
                               ),
                                onPressed:(){
                                  _selectlistUser();
                                  Future.delayed(const Duration(seconds: 1)).then((_){
                                    Navigator.pushNamed(context, 'ChooseUser_page');
                                  });
                                }
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 170,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black26,width: 3)
                            ),
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: Colors.white,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: Colors.white,
                                    elevation:7
                                ),
                                child:Column(
                                  children: [
                                    Container(
                                      height: 113,
                                      margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child:Image.asset(
                                          'images/founda.png',
                                          fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    const Text('美容',
                                      style: TextStyle(
                                        fontSize: 27,color: Colors.indigo,
                                      ),
                                    )
                                  ],
                                ),
                                onPressed:(){
                                  //_selectlistUser();
                                  Future.delayed(const Duration(seconds: 1)).then((_){
                                    //Navigator.pushNamed(context, 'ChooseUser_page');
                                  });
                                }
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0,20,0,30),
                        //padding:const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        height: 45,
                        width: 210,
                        child:ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            elevation: 7
                          ),
                          icon: Icon(Icons.import_contacts,color: Colors.white,),
                          label: const Text('ご利用方法',
                                style: TextStyle(fontSize: 25,
                                  color:Colors.white,
                                  fontWeight:FontWeight.bold,
                                )
                            ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context){
                                return Manual_Page();
                              })
                            );
                          },
                        ),
                      )
                    ]
                ),
              ),

            ]
        ),
      ),
    );
  }

  DBuser dbUser = DBuser();//DBクラスのインスタンス生成
  //ユーザの追加処理
  void _selectlistUser() async {
    debugPrint('_selectAllUserにきました');
    final result = await dbUser.selectlistUser();
    debugPrint('userNameの中身$result');
    _selectAdd();
  }

  DBadd dbAdd = DBadd();//DBクラスのインスタンス生成

  void _selectAdd() async {
    debugPrint('_selectAddにきました');
    final List<String> hiragana = await dbAdd.selectAdd();//ひらがなslectメソッド結果
    final List<String> import = DBadd.AddList;//import結果
    debugPrint('追加成分の内容:$hiragana');
    debugPrint('Addlistをimportした結果：$import');
    debugPrint(DBadd.AddList.toString());
  }
}