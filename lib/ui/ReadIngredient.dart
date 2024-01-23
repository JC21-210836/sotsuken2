import 'package:flutter/material.dart';
import 'package:sotsuken2/component/AppbarComp.dart';
import '../Api/api.dart';

class ReadIngredient extends StatefulWidget {
  const ReadIngredient({super.key});

  @override
  _ReadIngredientState createState() => _ReadIngredientState();
}

class _ReadIngredientState extends State<ReadIngredient> {
  List<String> vals = ["読み込み中"];
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
    List<String> contentList = await Api.instance.getContentList();
    if(mounted){
      setState(() {
        print("セットステートするで");
        vals = contentList;
        print("vals$vals");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.indigoAccent)),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.indigoAccent)),
                      child: const FittedBox(
                        child: Text(
                          '読み取った成分',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.indigoAccent, width: 1)),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.indigoAccent, width: 1)),
                        margin: const EdgeInsets.all(5),
                        width: 240,
                        height: 180,
                        //list形式の表示してます
                        child: ListView.builder(
                          itemCount: vals.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0)
                                  .copyWith(left: 5.0),
                              child: Text('・${vals[index]}',style:const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,height: 1.3)),
                            );
                          },
                        ),
                      )),
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
                  Container(
                    height: 55,
                    width: 260,
                    margin: const EdgeInsets.fromLTRB(5,5,5,20),
                    child:ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          elevation: 7
                      ),
                      onPressed: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName('ChooseUser_page'));
                      },
                      child: const FittedBox(
                        child: Text(
                          '他のユーザーを選択する',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
