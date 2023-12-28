import 'package:flutter/material.dart';
//臨時


class StateReadIngredient extends StatefulWidget{
  const StateReadIngredient({super.key});

  @override
  State<StateReadIngredient> createState(){
    return ReadIngredient();
  }
}

class ReadIngredient extends State<StateReadIngredient>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text('成分チェッカー')
      ),
      body: Center(
          child:SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[

                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  decoration: BoxDecoration(
                      border: Border.all(color:Colors.indigoAccent)
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color:Colors.indigoAccent)
                    ),
                    child: const FittedBox(
                      child:Text('読み込み結果',
                        style: TextStyle(
                            fontSize: 24,
                            color:Colors.indigo,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 7),
                    decoration: BoxDecoration(
                        border: Border.all(color:Colors.indigoAccent,width: 1)
                    ),
                    child:Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.indigoAccent,width: 1)
                      ),
                      margin: const EdgeInsets.all(5),
                      width: 300,
                      height: 320,
                      //多分↓ここのconst邪魔になる
                      child:const Column(
                        children: [
                          Text(''),
                          Text(''),
                          Text(''),
                        ],
                      ),
                    )
                ),

                Container(
                  height: 60,
                  width: 300,
                  margin: const EdgeInsets.all(5),
                  child:OutlinedButton(
                    style:OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    onPressed: (){

                    },
                    child: const FittedBox(
                      child: Text('他の商品をスキャンする',
                        style:TextStyle(
                          fontSize: 24,
                          color:Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 300,
                  margin: const EdgeInsets.all(5),
                  child:OutlinedButton(
                    style:OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: (){
                      Navigator.popUntil(context,ModalRoute.withName('ChooseUser_page'));
                    },
                    child: const FittedBox(
                      child: Text('他のユーザーを選択する',
                        style:TextStyle(
                          fontSize: 24,
                          color:Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}