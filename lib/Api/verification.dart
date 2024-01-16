import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../DB/Database.dart';
//import '../DB/List.dart';
import '../Data/AllAnotherData.dart';
import '../Data/AllObligationData.dart';
import '../Data/AllRecommendationData.dart';
import 'api.dart';

class verifications{
  verifications._();
  static final verifications instance = verifications._();
  List<String> select = [];
  // 文字認識結果とユーザ選択成分の照合
  Future<List<String>> verification() async{
    //選択した値格納変数
    select = await AllObligationData().getValueCheck();
    select.addAll(await AllRecommendationData().getValueCheck2());
    select.addAll(await AllAnotherData().getValueCheck3());

    //文字認識結果格納変数
    List<String> resultvalues = await Api.instance.result();

    print("verificationのresultvalues：$resultvalues");
    print("verificationのselect：$select");

    List<String> result = [];

    print("Foodselect呼び出す");
    List<String> foodSelect = await Foodselect();


    for(String str in foodSelect){
      for(String s in resultvalues) {
        if (s.contains(str)) {
          if(!result.contains(str)){
            result.add(str);
            debugPrint("追加2：　$str");
          }
          debugPrint("表示2： $result");
          break;
        }
      }
    }if(result.isEmpty){
      result.add("No");
    }
    return result;
  }

  //リストから照合
  /*void selectName(String UserName) async{

    Database db = await DBProvider.instance.database;
    DBlist dbList = DBlist();
    List<String> select = [];
    List<String> foodname = await Foodselect();
    print("void selectNameに持ってきた：$foodname");

    final selectList = await db.rawQuery('SELECT hiragana,kanji,eigo,otherName FROM k_add where categoryid = ?',['TS']);
    final int userid = await dbList.selectUserId(UserName);
    final foodId = await db.rawQuery('SELECT foodid FROM list where userid = ?',['TS']);

    List<Map<String, dynamic>> selectedList = await db.rawQuery('SELECT hiragana,kanji,eigo,otherName FROM k_add where categoryid = ? ',['TS']);
    print("selectList：$selectList");

    //Map→list変換
    List<dynamic> addFoodDynamic = selectedList
        .map((map) => [map['hiragana'], map['kanji'], map['eigo']])
        .expand((element) => element)
        .where((element) => element != null)
        .toList();

    //List<dynamic>→List<String>変換
    List<String> addFood = addFoodDynamic.cast<String>();
  }*/

  //データ取得部分
  Future <List<String>> Foodselect()async {
    Database db = await DBProvider.instance.database;
    List<Map<String, dynamic>> gimu = [];
    List<Map<String, dynamic>> g = [];
    List<String> All = [];
    print("if文検証する");
    if(select.isNotEmpty){
      print("if文に入った");
      for (int x = 0; x < select.length; x++) {
        print("for文に入った");
        if(AllObligationData.valueList[0].contains(select[x])) { //表示義務
          print("えびにきた");
          gimu = await db.rawQuery('SELECT foodname FROM food WHERE foodid != ? AND foodid LIKE ?', ['GA1','GA%']);
          g.addAll(gimu);
        }else if(AllObligationData.valueList[1].contains(select[x])){
          print("かににきた");
          gimu = await db.rawQuery('SELECT foodname FROM food WHERE foodid != ? AND foodid LIKE ?', ['GC1','GC%']);
          g.addAll(gimu);
        }else if(AllObligationData.valueList[2].contains(select[x])){
          print("くるみにきた");
          gimu = await db.rawQuery('SELECT foodname FROM food WHERE foodid != ? AND foodid LIKE ?', ['GB1','GB%']);
          g.addAll(gimu);
        }else if(AllObligationData.valueList[3].contains(select[x])){
          print("小麦にきた");
          gimu = await db.rawQuery('SELECT foodname FROM food WHERE foodid != ? AND foodid LIKE ?', ['GD2','GD%']);
          g.addAll(gimu);
        }else if(AllObligationData.valueList[4].contains(select[x])){
          print("そばにきた");
          gimu = await db.rawQuery('SELECT foodname FROM food WHERE foodid != ? AND foodid LIKE ?', ['GE1','GE%']);
          g.addAll(gimu);
        }else if(AllObligationData.valueList[5].contains(select[x])){
          print("卵にきた");
          gimu = await db.rawQuery('SELECT foodname FROM food WHERE foodid != ? AND foodid LIKE ?', ['GF2','GF%']);
          g.addAll(gimu);
        }else if(AllObligationData.valueList[6].contains(select[x])){
          print("乳にきた");
          gimu = await db.rawQuery('SELECT foodname FROM food WHERE foodid != ? AND foodid LIKE ?', ['GG1','GG%']);
          g.addAll(gimu);
        }else if(AllObligationData.valueList[7].contains(select[x])){
          print("落花生にきた");
          gimu = await db.rawQuery('SELECT foodname FROM food WHERE foodid != ? AND foodid LIKE ?', ['GH2','GH%']);
          g.addAll(gimu);
        }
        print("これからわけます：$g");
        for (Map<String, dynamic> data in g) {
          data.forEach((key, value) {
            All.add(value as String);
          });
        }
        debugPrint('該当する表示義務を取ってきました$All');
      }
    }
    debugPrint('名前だけをとってきました：$All');
    return All;
  }
}