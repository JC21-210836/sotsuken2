import 'package:flutter/material.dart';
import 'package:sotsuken2/ui/AllergyDetection.dart';
import 'Recommendation_allergy.dart';
import 'package:sotsuken2/Data/AllObligationData.dart';
//臨時
import 'AllergyDetection.dart';


class CheckBoxT extends StatefulWidget{
  final int PageFlag;
  const CheckBoxT({Key?key, required this.PageFlag}): super(key:key) ;

  @override
  State<CheckBoxT> createState(){
    return Obligation_allergy_Page();
  }
}

class Obligation_allergy_Page extends State<CheckBoxT>{
//チェックボックスの数だけいる(8)
  bool cEbi = false;
  bool cKani = false;
  bool cKurumi = false;
  bool cKomugi = false;
  bool cSoba = false;
  bool cTamago = false;
  bool cNyuu = false;
  bool cRakkasei = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('成分チェッカー'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            decoration:BoxDecoration(
              border: Border.all(
                color:Colors.deepOrange,
                width: 1,
              ),
            ),
            child: const Text('表示義務アレルギー',
                style: TextStyle(
                    fontSize: 33,
                    color:Colors.deepOrange,
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
                          child:const Text('えび',style:TextStyle(fontSize: 20,)),
                        ),
                        value: cEbi,
                        onChanged: (value){
                          setState(() {
                            cEbi = value!;
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
                          child:const Text('かに',style:TextStyle(fontSize: 20)),
                        ),
                        value: cKani,
                        onChanged: (value){
                          setState(() {
                            cKani = value!;
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
                          child:const Text('くるみ',style:TextStyle(fontSize: 20,)),
                        ),
                        value: cKurumi,
                        onChanged: (value){
                          setState(() {
                            cKurumi = value!;
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
                          child:const Text('小麦',style:TextStyle(fontSize: 20)),
                        ),
                        value: cKomugi,
                        onChanged: (value){
                          setState(() {
                            cKomugi = value!;
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
                          child:const Text('そば',style:TextStyle(fontSize: 20,)),
                        ),
                        value: cSoba,
                        onChanged: (value){
                          setState(() {
                            cSoba = value!;
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
                          child:const Text('卵',style:TextStyle(fontSize: 20)),
                        ),
                        value: cTamago,
                        onChanged: (value){
                          setState(() {
                            cTamago = value!;
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
                          child:const Text('乳',style:TextStyle(fontSize: 20,)),
                        ),
                        value: cNyuu,
                        onChanged: (value){
                          setState(() {
                            cNyuu = value!;
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
                          child:const Text('落花生',style:TextStyle(fontSize: 20)),
                        ),
                        value: cRakkasei,
                        onChanged: (value){
                          setState(() {
                            cRakkasei = value!;
                          });
                        },
                      )
                  )
              ),
            ],
          ),

          Container(
            width: 320,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
            child:OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.indigo, side: const BorderSide(
                    color: Colors.indigoAccent,
                    width: 1.5,
                  )
              ),
              onPressed:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return CheckBoxT2(PageFlag: widget.PageFlag);
                    })
                );
                AllObligationData aod = AllObligationData();
                aod.setObligationBool([cEbi,cKani,cKurumi,cKomugi,cSoba,cTamago,cNyuu,cRakkasei]);
                aod.HanteiObligation();
              },
              child: const Text('表示推奨アレルギーを\n選択する',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center
              ),
            ),
          ),
          Container(
            width: 320,
            height: 80,
            padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
            child:OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.indigo, side: const BorderSide(
                    color: Colors.indigoAccent,
                    width: 1.5,
                  )
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
            padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
            child:  OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepOrange, side: const BorderSide(
                    color: Colors.deepOrange,
                    width: 1.5,
                  )
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
                }
                debugPrint(widget.PageFlag.toString());
                AllObligationData aod = AllObligationData();
                aod.setObligationBool([cEbi,cKani,cKurumi,cKomugi,cSoba,cTamago,cNyuu,cRakkasei]);
                aod.HanteiObligation();

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
    );
  }
}