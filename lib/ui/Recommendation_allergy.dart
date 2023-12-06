import 'package:flutter/material.dart';
import 'package:sotsuken2/ui/AllergyDetection.dart';
import 'package:sotsuken2/Data/AllRecommendationData.dart';


class CheckBoxT2 extends StatefulWidget{
  final int PageFlag;
  const CheckBoxT2({Key?key, required this.PageFlag}): super(key:key) ;

  @override
  State<CheckBoxT2> createState(){
    return Recommendation_allergy_Page();
  }
}

class Recommendation_allergy_Page extends State<CheckBoxT2> {
//チェックボックスの数だけいる(20)
  bool cAlmond = false; //アーモンド
  bool cAwabi = false;
  bool cIka = false;
  bool cIkura = false;
  bool cOrange = false;
  bool cBeef = false;   //牛肉
  bool cGoma = false;
  bool cSake = false;
  bool cSaba = false;
  bool cDaizu = false;
  bool cChicken = false; //鶏肉
  bool cBanana = false;
  bool cPork = false;    //豚肉
  bool cMatsutake = false;
  bool cMomo = false;
  bool cYamaimo = false;   //牛肉
  bool cRingo = false;
  bool cZeratin = false;
  bool cCashewnut = false;  //カシューナッツ
  bool cKiui = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('成分チェッカー'),
      ),
      body: Center(
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                decoration:BoxDecoration(
                  border: Border.all(
                    color:Colors.indigo,
                    width: 1,
                  ),
                ),
                child: const Text('表示推奨アレルギー',
                    style: TextStyle(
                        fontSize: 33,
                        color:Colors.indigo,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),

              Row(
                children: [
                  Container(
                      width:180,
                      margin:const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('あわび',style:TextStyle(fontSize: 20)),
                            ),
                            value: cAwabi,
                            onChanged: (value){
                              setState(() {
                                cAwabi = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                      width:170,
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('いか',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cIka,
                            onChanged: (value){
                              setState(() {
                                cIka = value!;
                              });
                            },
                          )
                      )
                  ),
                ],
              ),

              Row(
                children: [
                  Container(
                      width:180,
                      margin:const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('いくら',style:TextStyle(fontSize: 20)),
                            ),
                            value: cIkura,
                            onChanged: (value){
                              setState(() {
                                cIkura = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                      width:170,
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('オレンジ',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cOrange,
                            onChanged: (value){
                              setState(() {
                                cOrange = value!;
                              });
                            },
                          )
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width:180,
                      margin:const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('牛肉',style:TextStyle(fontSize: 20)),
                            ),
                            value: cBeef,
                            onChanged: (value){
                              setState(() {
                                cBeef = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                      width:170,
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('ごま',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cGoma,
                            onChanged: (value){
                              setState(() {
                                cGoma = value!;
                              });
                            },
                          )
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width:180,
                      margin:const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('さけ',style:TextStyle(fontSize: 20)),
                            ),
                            value: cSake,
                            onChanged: (value){
                              setState(() {
                                cSake = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                      width:170,
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('さば',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cSaba,
                            onChanged: (value){
                              setState(() {
                                cSaba = value!;
                              });
                            },
                          )
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width:180,
                      margin:const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('大豆',style:TextStyle(fontSize: 20)),
                            ),
                            value: cDaizu,
                            onChanged: (value){
                              setState(() {
                                cDaizu = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                      width:170,
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('鶏肉',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cChicken,
                            onChanged: (value){
                              setState(() {
                                cChicken = value!;
                              });
                            },
                          )
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width:180,
                      margin:const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('バナナ',style:TextStyle(fontSize: 20)),
                            ),
                            value: cBanana,
                            onChanged: (value){
                              setState(() {
                                cBanana = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                      width:170,
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('豚肉',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cPork,
                            onChanged: (value){
                              setState(() {
                                cPork = value!;
                              });
                            },
                          )
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width:180,
                      margin:const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('まつたけ',style:TextStyle(fontSize: 20)),
                            ),
                            value: cMatsutake,
                            onChanged: (value){
                              setState(() {
                                cMatsutake = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                      width:170,
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('もも',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cMomo,
                            onChanged: (value){
                              setState(() {
                                cMomo = value!;
                              });
                            },
                          )
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width:180,
                      margin:const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('やまいも',style:TextStyle(fontSize: 20)),
                            ),
                            value: cYamaimo,
                            onChanged: (value){
                              setState(() {
                                cYamaimo = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                      width:170,
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('りんご',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cRingo,
                            onChanged: (value){
                              setState(() {
                                cRingo = value!;
                              });
                            },
                          )
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width:180,
                      margin:const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('ゼラチン',style:TextStyle(fontSize: 20)),
                            ),
                            value: cZeratin,
                            onChanged: (value){
                              setState(() {
                                cZeratin = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                    width:170,

                  ),
                ],
              ),



              Row(
                children: [
                  Container(
                      width:280,
                      margin:const EdgeInsets.fromLTRB(55, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('アーモンド',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cAlmond,
                            onChanged: (value){
                              setState(() {
                                cAlmond = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                    width:70,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width:280,
                      margin:const EdgeInsets.fromLTRB(55, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('カシューナッツ',style:TextStyle(fontSize: 20,)),
                            ),
                            value: cCashewnut,
                            onChanged: (value){
                              setState(() {
                                cCashewnut = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                    width:70,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width:280,
                      margin:const EdgeInsets.fromLTRB(55, 0, 0, 0),
                      child:Transform.scale(
                          scale:1.3,
                          child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Transform.translate(
                              offset: const Offset(-15,0),
                              child:const Text('キウイフルーツ',style:TextStyle(fontSize: 20)),
                            ),
                            value: cKiui,
                            onChanged: (value){
                              setState(() {
                                cKiui = value!;
                              });
                            },
                          )
                      )
                  ),
                  Container(
                    width:70,
                  ),
                ],
              ),


              Container(
                width: 320,
                height: 80,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                child:OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.indigoAccent,
                        width: 1.5,
                      ),
                      primary:Colors.indigo
                  ),
                  onPressed:(){

                  },
                  child: const Text('登録済み成分を選択',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                ),
              ),
              Container(
                height: 80,
                width: 320,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                child:  OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.deepOrange,
                        width: 1.5,
                      ),
                      primary:Colors.deepOrange
                  ),
                  onPressed:(){
                    if(widget.PageFlag == 0){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return const StateAllergyDetection();
                          })
                      );
                    }else if(widget.PageFlag == 1){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }
                    debugPrint(widget.PageFlag.toString());
                    AllRecommendationData ard = AllRecommendationData();
                    ard.setRecommendationBool([cAwabi,cIka,cIkura,cOrange,cBeef,cGoma,cSake,cSaba,cDaizu,cChicken,
                      cBanana,cPork,cMatsutake,cMomo,cYamaimo,cRingo,cZeratin,cAlmond,cCashewnut,cKiui]);
                    ard.HanteiRecommendation();
                  },
                  child: const Text('決定',style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                      textAlign: TextAlign.center),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
