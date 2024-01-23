import 'package:flutter/material.dart';
import 'package:sotsuken2/component/AppbarComp.dart';
import 'package:sotsuken2/Api/verification.dart';
import 'package:sotsuken2/ui/ReadIngredient.dart';

class StateAllergyDetection extends StatefulWidget{
 const StateAllergyDetection({super.key});
  @override
  AllergyDetection_Page createState() => AllergyDetection_Page();
}

class AllergyDetection_Page extends State<StateAllergyDetection>{
  List<String>vals = ["読み込み中"];
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    if (!_isInitialized) {
      // 非同期処理を直接行わず、Future.delayedを使用して非同期処理が完了後にsetStateを呼ぶ
      Future.delayed(Duration.zero, () {
        postData();
        _isInitialized = true;
      });
    }
  }

  void postData() async {
    List<String> contentList = await verifications.instance.verification();
    if (mounted) {
      setState(() {
        print("セットステートするで");
        vals = contentList;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    print("AllergyDetectionにきた");
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
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                    decoration: BoxDecoration(
                        border: Border.all(color:Colors.deepOrange)
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.fromLTRB(13, 10, 13, 10),
                      color: Colors.deepOrange,
                      child: const FittedBox(
                        child:Text('検出されたアレルゲン',
                          style: TextStyle(
                              fontSize: 24,
                              color:Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color:Colors.deepOrange,width: 1)
                    ),
                    child:Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.deepOrange,width: 1)
                      ),
                      margin: const EdgeInsets.all(5),
                      width: 300,
                      height: 200,

                      //ここが表示部分
                      child:ListView.builder(
                        itemCount: vals.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0)
                                .copyWith(left: 5.0),
                            child: Text('・${vals[index]}',style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,height: 1.3)),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 260,
                    margin: const EdgeInsets.all(10),
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0,0,5,30),
                          height: 80,
                          width: 140,
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
                              child:Text('他のユーザー\nを選択する',
                                  style:TextStyle(
                                    fontSize: 20,
                                    color:Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign:TextAlign.center
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5,0,0,30),
                          height: 80,
                          width: 130,
                          child:OutlinedButton(
                              style:OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              child: const FittedBox(
                                child:Text('読み取った\n成分を見る',
                                    style:TextStyle(
                                      fontSize: 20,
                                      color:Colors.indigo,
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