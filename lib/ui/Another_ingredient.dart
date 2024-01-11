import 'package:flutter/material.dart';
import 'package:sotsuken2/DB/Database.dart';
import 'package:sotsuken2/Data/AllObligationData.dart';
import 'package:sotsuken2/Data/AllRecommendationData.dart';
import 'AddAnotherIngredient.dart';

import 'package:sotsuken2/Data/AllAnotherData.dart';

//臨時
import 'AllergyDetection.dart';




class StateAnother_ingredient extends StatefulWidget{
  final String PageFlag;
  int PageCount = 0;
  StateAnother_ingredient({super.key, required this.PageFlag,required this.PageCount});

  @override
  State<StateAnother_ingredient> createState(){
    return Another_ingredient();
  }
}


class Another_ingredient extends State<StateAnother_ingredient>{
  AllObligationData aod = AllObligationData();
  AllRecommendationData ard = AllRecommendationData();
  AllAnotherData aad = AllAnotherData();

  //test
  bool sushi = false;

  int forMethod(){
    int forCount;
    if(DBProvider.AddList.length % 2 == 1){
      forCount = DBProvider.AddList.length+1;
    }else{
      forCount = DBProvider.AddList.length;
    }
    return forCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: const Text('成分チェッカー'),
        ),
        body: Center(
            child:SingleChildScrollView(
                child:Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        decoration:BoxDecoration(
                          border: Border.all(
                            color:Colors.indigo,
                            width: 1,
                          ),
                        ),
                        child: const Text('その他の登録した成分',
                            style: TextStyle(
                                fontSize: 24,
                                color:Colors.indigo,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),

                      if(DBProvider.AddList.isEmpty)...[
                        Container(
                          margin: const EdgeInsets.all(30),
                          child:const Text('何も登録されていません',style: TextStyle(fontSize: 25),),
                        ),
                      ]else...[
                        for(int n = 0 ; n < forMethod(); n = n+2)...[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for(int nn = 0 ; nn < 2  ; nn++)...[
                                  if(nn == 0)...[

                                    Container(
                                      width: 167,
                                      child:Transform.scale(
                                        scale:1.1,
                                        child: CheckboxListTile(
                                            controlAffinity: ListTileControlAffinity.leading,
                                            title: Transform.translate(
                                              offset: const Offset(-15,0),
                                              child:Text(DBProvider.AddList[n+nn],style: TextStyle(fontSize: 17)),
                                            ),
                                            value: aad.getBool3()[n+nn],
                                            onChanged: (value) {
                                              setState(() {
                                                aad.getBool3()[n+nn] = value!;
                                              });
                                            }
                                        ),
                                      ),
                                    ),

                                  ]else...[

                                    if(DBProvider.AddList.length % 2 == 1 && DBProvider.AddList.length == n+1)...[
                                      Container(
                                        width: 167,
                                      ),
                                    ]else...[
                                      Container(
                                        width: 167,
                                        child:Transform.scale(
                                          scale:1.1,
                                          child: CheckboxListTile(
                                              controlAffinity: ListTileControlAffinity.leading,
                                              title: Transform.translate(
                                                offset: const Offset(-15,0),
                                                child:Text(DBProvider.AddList[n+nn],style: TextStyle(fontSize: 18)),
                                              ),
                                              value: aad.getBool3()[n+nn],
                                              onChanged: (value) {
                                                setState(() {
                                                  aad.getBool3()[n+nn] = value!;
                                                });
                                              }
                                          ),
                                        ),
                                      ),
                                    ]

                                  ]
                                ],
                              ]
                          )

                        ],
                      ],

                      Container(
                        width: 290,
                        height: 90,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                        child:  OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.indigo,
                              side: const BorderSide(
                                color: Colors.blue,
                                width: 1.5,
                              )
                          ),
                          onPressed:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return StateAddAnotherIngredient(widget.PageFlag,widget.PageCount);
                                })
                            ).then((value){
                              setState(() {});
                            });
                          },
                          child: const Text('その他の追加成分を\n新規登録',style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Container(
                        width: 290,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                        child:  OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.deepOrange, side: const BorderSide(
                            color: Colors.deepOrange,
                            width: 1.5,
                          )
                          ),
                          onPressed:(){
                            if(widget.PageFlag == 'ChooseUser'){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context){
                                    return const StateAllergyDetection();
                                  })
                              );

                            }else if(widget.PageFlag == 'CreateUser'){
                              Navigator.of(context).pop();
                            }else if(widget.PageFlag == 'SettingUser'){
                              debugPrint(widget.PageCount.toString());
                              for(int n = 0 ; n <= widget.PageCount; n++){
                                Navigator.of(context).pop();
                              }
                            }
                            aod.HanteiObligation();
                            ard.HanteiRecommendation();
                            aad.HanteiAnother();
                          },
                          child: const Text('決定',style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                              textAlign: TextAlign.center),
                        ),
                      )
                    ]
                )
            )
        )
    );
  }
}