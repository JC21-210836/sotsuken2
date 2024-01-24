import 'package:flutter/material.dart';
import 'package:sotsuken2/component/AppbarComp.dart';
import 'package:sotsuken2/ui/ReadIngredient.dart';

import 'ImageLoaderSelect.dart';

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
    print("AllergyNotDetectionにきた");
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:[Colors.white,Color(0xFF90D4FA)],
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
            child:SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[

                  Container(
                    margin: EdgeInsets.fromLTRB(9, 30, 9, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color:Colors.indigo)
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color:Colors.indigo)
                      ),
                      child:const Text('読み込み結果',
                        style: TextStyle(
                            fontSize: 26,
                            color:Colors.indigo,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child:const Text('指定されたアレルゲンは\n見つかりませんでした。',
                      style: TextStyle(
                          color:Colors.indigo,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Container(
                    width: 280,
                    margin:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:Image.asset('images/duck.png'),
                  ),

                  Container(
                    height: 55,
                    width: 260,
                    margin: const EdgeInsets.all(10),
                    child:ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          elevation: 7
                      ),
                      onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context){
                              return const StateImageLoderSelect();
                            })
                        );
                      },
                      child: const FittedBox(
                        child: Text('他の商品をスキャンする',
                          style:TextStyle(
                            fontSize: 24,
                            color:Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0,0,5,30),
                          height: 70,
                          width: 140,
                          child:ElevatedButton(
                            style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                elevation: 7
                            ),
                            onPressed: (){
                              Navigator.popUntil(context,ModalRoute.withName('ChooseUser_page'));
                            },
                            child: const FittedBox(
                              child:Text('他のユーザー\nを選択する',
                                  style:TextStyle(
                                    fontSize: 20,
                                    color:Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign:TextAlign.center
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5,0,0,30),
                          padding:EdgeInsets.fromLTRB(3, 0, 3, 0),
                          height: 70,
                          width: 130,
                          child:ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  elevation: 7
                              ),
                              child: const FittedBox(
                                child:Text('読み取った\n成分を見る',
                                    style:TextStyle(
                                      fontSize: 20,
                                      color:Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign:TextAlign.center
                                ),
                              ),
                              onPressed: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context){
                                      return ReadIngredient();
                                    })
                                );
                              }
                          ),
                        )
                      ]
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}