import 'package:flutter/material.dart';
import 'CreateUser1.dart';
import 'Obligation_allergy.dart';
import 'package:sotsuken2/Data/AllUserData.dart';

class StateChooseUser extends StatefulWidget{
  const StateChooseUser({super.key});

  @override
  State<StateChooseUser> createState(){
    return ChooseUser_Page();
  }
}

String valueName1 = "";
String valueName2 = "";
String valueName3 = "";
String valueName4 = "";
String valueName5 = "";

class ChooseUser_Page extends State<StateChooseUser>{

  void ReturnAndReload() async{
    await Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return const StateCreateUser1();
        })
    );
    setState(() {
      AllUserData aud = AllUserData();
      switch (aud.getUserNames().length){
        case 5 :
          valueName5 = aud.getUserNames()[4];
        case 4 :
          valueName4 = aud.getUserNames()[3];
        case 3 :
          valueName3 = aud.getUserNames()[2];
        case 2 :
          valueName2 = aud.getUserNames()[1];
        case 1 :
          valueName1 = aud.getUserNames()[0];
          break;
        default:
        //エラーのポップアップとかできないかな
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          title: const Text('成分チェッカー')
      ),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Container(
                padding:const EdgeInsets.fromLTRB(28, 5, 28, 5),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                color:Colors.indigo,

                child: const Text('登録された情報を\n利用しますか？',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Colors.blue,
                    width: 1,
                  ),
                ),
                child:Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:Colors.blue,
                      width: 1,
                    ),
                  ),
                  child:Column(
                    children: [
                      Container(
                        width: 240,
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        child: OutlinedButton(
                          child:Text(valueName1,style: const TextStyle(fontSize: 25),),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 240,
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        child: OutlinedButton(
                          child:Text(valueName2,style: const TextStyle(fontSize: 25),),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 240,
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        child: OutlinedButton(
                          child:Text(valueName3,style: const TextStyle(fontSize: 25),),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 240,
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        child: OutlinedButton(
                          child:Text(valueName4,style: const TextStyle(fontSize: 25),),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 240,
                        height: 50,
                        margin: const EdgeInsets.all(2),
                        child: OutlinedButton(
                          child:Text(valueName5,style: const TextStyle(fontSize: 25),),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),


                ),
              ),

              Container(
                height: 60,
                width: 270,
                margin: const EdgeInsets.all(10),
                child:OutlinedButton(
                  style:OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: (){
                    ReturnAndReload();
                    /*
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const StateCreateUser1();
                        })

                    ).then((value) {
                      setState((){
                        AllUserData aud = AllUserData();
                        valueName1 = AllUserData.UserName;
                      });
                    }

                    );
                     */
                  },
                  child: const Text('新しいユーザを登録',
                    style:TextStyle(
                        fontSize: 25,
                        color:Colors.indigo,
                        fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 60,
                    width: 140,
                    child:OutlinedButton(
                      style:OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                      onPressed: (){
                        valueName1 = valueName1;
                      },
                      child: const Text('設定',
                        style:TextStyle(
                            fontSize: 25,
                            color:Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.all(5),
                      height: 60,
                      width: 140,
                      child:OutlinedButton(
                        style:OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        child: const Text('SKIP',
                          style:TextStyle(
                              fontSize: 25,
                              color:Colors.indigo,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context){
                              return  CheckBoxT(PageFlag: 0);
                            }),
                          );
                        },
                      )
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}