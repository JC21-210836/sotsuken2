import 'package:flutter/material.dart';
//臨時
import 'AllergyNotDetection.dart';

class StateAllergyDetection extends StatefulWidget{
  const StateAllergyDetection({super.key});

  @override
  State<StateAllergyDetection> createState(){
    return AllergyDetection_Page();
  }
}

class AllergyDetection_Page extends State<StateAllergyDetection>{

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
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.deepOrange)
                ),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  color: Colors.deepOrange,
                  child:const Text('検出されたアレルゲン',
                    style: TextStyle(
                        fontSize: 33,
                        color:Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child:const Text('以下のアレルゲンが検出されました',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.deepOrange,width: 1)
                ),
                child:Container(
                  decoration: BoxDecoration(
                      border: Border.all(color:Colors.deepOrange,width: 1)
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
                      Text(''),
                      Text(''),
                      Text(''),
                    ],
                  ),
                )
              ),

              Container(
                height: 65,
                width: 310,
                margin: const EdgeInsets.all(10),
                child:OutlinedButton(
                  style:OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return const StateAllergyNotDetection();
                      })
                    );
                  },
                  child: const Text('他の商品をスキャンする',
                    style:TextStyle(
                      fontSize: 25,
                      color:Colors.deepOrange,
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
                    height: 80,
                    width: 180,
                    child:OutlinedButton(
                      style:OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: (){

                      },
                      child: const Text('他のユーザー\nを選択する',
                        style:TextStyle(
                          fontSize: 24,
                          color:Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign:TextAlign.center
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 80,
                    width: 180,
                    child:OutlinedButton(
                      style:OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      child: const Text('読み取った\n成分を見る',
                        style:TextStyle(
                          fontSize: 24,
                          color:Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign:TextAlign.center
                      ),
                      onPressed: (){}
                    ),
                  )
                ]
              )
            ],
          ),
        )
      ),
    );
  }
}