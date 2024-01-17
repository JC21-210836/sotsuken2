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
    select.addAll(foodSelect);
    print("呼出し後のセレクト：$select");
    select = select.toSet().toList();
    print("重複排除後のセレクト：$select");

    for(String str in select){
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

    if (select.isNotEmpty) {
      print("if文に入った");
      Map<String, String> obligationMappings = {
        'えび': 'GA%',
        'くるみ': 'GB%',
        'かに': 'GC%',
        '小麦': 'GD%',
        'そば': 'GE%',
        '卵': 'GF%',
        '乳': 'GG%',
        '落花生': 'GH%',
      };

      for (var value in select) {
        print("for文に入った");

        if (obligationMappings.containsKey(value)) {
          print("$value にきた");
          gimu = await db.rawQuery('SELECT foodname FROM food WHERE foodid LIKE ?', [obligationMappings[value]]);
          g.addAll(gimu);
        }
      }
    }
    print("これからわけます：$g");
    for (Map<String, dynamic> data in g) {
      data.forEach((key, value) {
        All.add(value as String);
      });
    }

    debugPrint('名前だけをとってきました：$All');
    return All;
  }
}