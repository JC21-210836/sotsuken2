import 'package:flutter/material.dart';

class StateAllergyNotDetection extends StatefulWidget{
  const StateAllergyNotDetection({super.key});

  @override
  State<StateAllergyNotDetection> createState(){
    return AllergyNotDetection_Page();
  }
}

class AllergyNotDetection_Page extends State<StateAllergyNotDetection>{

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
                      border: Border.all(color:Colors.indigo)
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    color: Colors.indigo,
                    child:const Text('読み込み結果',
                      style: TextStyle(
                          fontSize: 33,
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                  child:const Text('指定されたアレルゲンは\n見つかりませんでした。',
                      style: TextStyle(
                          color:Colors.indigo,
                          fontSize: 27,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  width: 280,
                  margin:const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child:Image.asset('images/duck.png'),
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