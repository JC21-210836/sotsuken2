import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../DB/Database.dart';
import '../DB/List.dart';
import '../DB/User.dart';
import '../Data/AllAnotherData.dart';
import '../Data/AllObligationData.dart';
import '../Data/AllRecommendationData.dart';
import 'api.dart';

class verifications{
  verifications._();
  static final verifications instance = verifications._();
  List<String> select = [];	//チェックボックスに表示してる文字を格納
  List<String> others = [];	//その他の文字を格納
  int userid = 0;
  List<String> resultfood = [];

  // 文字認識結果とユーザ選択成分の照合
  Future<List<String>> verification() async{
    Database db = await DBProvider.instance.database;
    List<String> foodIDValue = [];//foodidのみ
    List<String> foodNameValue = [];//foodnameのみ
    List<String> addNameValue = [];//追加成分

    print("これからユーザ検証");
    if((DBuser.userId.contains(userid))){
      print("ユーザ居た");
      //選択されたユーザーがユーザ表に存在したら
      final foodId = await db.rawQuery('SELECT foodid FROM list where userid = ?',[userid]);
      debugPrint("ユーザ$useridが登録したfoodidは$foodId");

      //foodIDをもとに、食品表のfoodnameを取得
      //foodidのvalueだけを抽出
      for (Map<String, dynamic?> value in foodId) {
        value.forEach((key, value) {
          foodIDValue.add(value as String); // foodidを1件ずつ格納
          debugPrint('foodIDValueの内容：$foodIDValue');
        });
      }
      debugPrint('最終的にfoodIDValueに入れた内容：$foodIDValue');

      //foodidをもとに、foodNameを特定
      for (int x = 0; x < foodIDValue.length; x++) {
        final foodId2 = await db.rawQuery('SELECT foodname FROM food where foodid = ?', [foodIDValue[x]]);
        for (Map<String, dynamic?> value2 in foodId2) {
          value2.forEach((key, value) {
            foodNameValue.add(value as String); // foodidを1件ずつ格納
            debugPrint('foodNameValueの内容：$foodNameValue');
          });
        }
        debugPrint('最終的にfoodNameValueに入れた内容：$foodNameValue');
      }
      others.addAll(foodNameValue);
      print("otherにいれてみた：$others");

      //とあるユーザがリスト表に登録しているaddidを取得
      final addid = await db.rawQuery('SELECT addid FROM list where userid = ?', [userid]);
      print("addid確認：$addid");

      /*先にひらがなのみselectにaddして、kanji,eigo,otherNameを後で格納する形にする*/

      //addidをもとにname
      for (Map<String, dynamic?> ADD in addid) {
        ADD.forEach((key, value) async {
          for (int x = 0; x < ADD.length; x++) {
            final addId2 = await db.rawQuery('SELECT hiragana,kanji,eigo,otherName FROM k_add where addid = ?', [value]);
            debugPrint('addId2の内容：$addId2');
            for (Map<String, dynamic?> value2 in addId2) {
              value2.forEach((key, value) {
                addNameValue.add(value as String);
                debugPrint('addNameValueの内容：$addNameValue');

                select.addAll(addNameValue);
                print("リストの追加成分結合した結果：$select");
              });
            }
          }
        });
      }
    }else{
      //選択した値格納変数
      select = await AllObligationData().getValueCheck();
      select.addAll(await AllRecommendationData().getValueCheck2());
      select.addAll(await AllAnotherData().getValueCheck3());

      //以降で持ってきた文字はothersに格納する
      print("Foodselect呼び出す");
      List<String> foodSelect = await Foodselect();
      select.addAll(foodSelect);
      print("呼出し後のセレクト：$select");
    }

    //文字認識結果格納変数
    List<String> resultvalues = await Api.instance.result();

    print("verificationのresultvalues：$resultvalues");
    print("verificationのselect：$select");

    List<String> result = [];

    select = select.where((element) => element.isNotEmpty).toList();
    print("空箱排除後のセレクト：$select");
    select = select.toSet().toList();
    print("重複排除後のセレクト：$select");

    for(String str in select){
      for(String s in resultvalues) {
        if (s.contains(str)) {
          if(!result.contains(str)){
            result.add(str);
            debugPrint("追加2：　$str");
          }
          break;
        }
      }
    }if(result.isEmpty){
      result.add("No");
    }

    print("これからチェックボックスに表示されている文字を抽出するよ：$result");

    List<String> selHira = [];

    //追加成分
    for (int i = 0; i < result.length; i++) {
      final selHiraQuery = await db.rawQuery('''SELECT hiragana FROM k_add WHERE hiragana = ? OR kanji = ? OR eigo = ? OR otherName = ?''', [result[i], result[i], result[i], result[i]]);
      for (Map<String, dynamic> row in selHiraQuery) {
        if (!selHira.contains(row['hiragana'].toString())) {
          selHira.add(row['hiragana'].toString());
        }
      }
    }

    //表示義務推奨
    for(int i = 0; i < result.length; i++){
      final foodName = result[i];
      final foodQuery = await db.rawQuery('SELECT foodid FROM food WHERE foodname = ?', [foodName]);

      for (Map<String, dynamic> row in foodQuery) {
        final foodId = row['foodid'].toString();
        final selId = foodId.substring(0, 2); // 左側二文字を抽出

        Map<String, String> id = {};
        id.addAll(AllObligationData.Gimu);
        id.addAll(AllRecommendationData.Sui);
        final targetId = id.keys.firstWhere((key) => id[key] == foodName, orElse: () => '');

        if (targetId.contains(selId)) { // targetId に selId が含まれているか確認
          resultfood.add(foodName);
        }
        print("現状のresultfood$resultfood");
      }

    }

    resultfood.addAll(selHira);

    print("これをかえすよ$resultfood");
    return resultfood;
  }

  List<String> getResultfood(){
    return resultfood;
  }

  //ユーザ選択された時
  void selectName(String UserName) async{
    print("selectNameにきた");
    DBlist dbList = DBlist();
    userid = await dbList.selectUserId(UserName);
    debugPrint("取得対象のユーザは$useridです");
  }

  //データ取得部分
  Future <List<String>> Foodselect()async {
    Database db = await DBProvider.instance.database;
    List<Map<String, dynamic>> gimu = [];
    List<Map<String, dynamic>> g = [];
    List<String> All = [];
    List<String> hira = [];

    if (select.isNotEmpty) {
      print("if文に入った");
      Map<String, String> obligationMappings = {
        //表示義務
        'えび': 'GA%',
        'くるみ': 'GB%',
        'かに': 'GC%',
        '小麦': 'GD%',
        'そば': 'GE%',
        '卵': 'GF%',
        '乳': 'GG%',
        '落花生': 'GH%',
        //ここから表示推奨
        'あわび': 'SB%',
        'いか': 'SC%',
        'オレンジ': 'SF%',
        'いくら': 'SD%',
        'ごま': 'SI%',
        'さけ': 'SJ%',
        'さば': 'SK%',
        '大豆': 'SL%',
        '鶏肉': 'SM%',
        'バナナ': 'NB%',
        '豚肉': 'SO%',
        'まつたけ': 'SP%',
        'もも': 'SQ%',
        'やまいも': 'SR%',
        'りんご': 'SS%',
        'ゼラチン': 'ST%',
        'アーモンド': 'SA%',
        'カシューナッツ': 'SE%',
        'キウイフルーツ': 'SG%',
      };

      //追加成分
      if (AllAnotherData.valueCheck3.isNotEmpty) {
        List<Map<String, dynamic>> hiragana = await db.rawQuery('SELECT hiragana FROM k_add WHERE categoryid = ?', ['TS']);
        debugPrint('ひらがなだけ取得：$hiragana');
        for (Map<String, dynamic?> data in hiragana) {
          data.forEach((key, value) {
            if (value != "" && value != null) {
              hira.add(value as String);
            }
          });
        }
        debugPrint("ひらがなだけ取ってきた$hira");

        for (int x = 0; x <
            AllAnotherData.boolList3.length; x++) { //可変長の文だけ回ります
          //ひらがなと一致した他データを取ってくる
          if (select.contains(hira[x])) { //もしひらがなリストにselectがふくまれていたら
            //ひらがなが一致する他データをとってくる
            gimu = await db.rawQuery('SELECT kanji,eigo,otherName FROM k_add WHERE categoryid = ? AND hiragana = ?', ['TS', hira[x]]);
          }

          debugPrint('追加成分の漢字と英語をその他を空白込みで取得：$gimu');

          for (Map<String, dynamic?> data in gimu) {
            data.forEach((key, value) {
              if (value != "" && value != null) {
                All.add(value as String);
              }
            });
          }
        }
      }

      for (var value in select) {
        if (obligationMappings.containsKey(value)) {
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