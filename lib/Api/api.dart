import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sotsuken2/DB/Food.dart';
import 'package:sotsuken2/Data/AllAnotherData.dart';
import 'package:sqflite/sqflite.dart';
import '../DB/Database.dart';
//import '../DB/List.dart';
import '../Data/AllObligationData.dart';
import '../Data/AllRecommendationData.dart';

class Api{
  static List<String> contentList = [""];
  Api._();
  static final Api instance = Api._();

  Future<void> postData(XFile img) async {
    print("パス：" + img.path);
    File file = File(img.path);
    // 画像のバイナリデータを読み込みます.
    ByteData data = await file.readAsBytes().then((bytes) =>
        ByteData.sublistView(Uint8List.fromList(bytes)));
    List<int> imageBytes = data.buffer.asUint8List(); // 修正

    var response = await http
        .post(Uri.parse(
        'https://r05-jk3a15cognitive.cognitiveservices.azure.com/computervision/imageanalysis:analyze?language=ja&api-version=2023-02-01-preview&features=read'),
        headers: {
          'Ocp-Apim-Subscription-Key': '2a4e99f274a14a94a4b5f26077b97cf0',
          'Content-Type': 'application/octet-stream',
        },
        body: imageBytes
    );
    Map<String, dynamic> jsonDataMap = json.decode(response.body);
    // "content"フィールドの値を取得
    String content = jsonDataMap['readResult']['content'];

    //contentの値を1行にする
    String contentMoji = content.replaceAll('\n', '');

    print(contentMoji);

    String genStr = "";

    if (contentMoji.contains("原材料")) {
      //原材料後、内容量までをString型で保持
      RegExp genNai = RegExp(r"原材料名(.*?)[內内]容量(.*)");
      RegExp gen = RegExp(r"原材料名(.*)");
      RegExpMatch? matchGenNai = genNai.firstMatch(contentMoji);
      RegExpMatch? matchGen = gen.firstMatch(contentMoji);

      debugPrint("マッチしたか1:$matchGenNai");
      debugPrint("マッチしたか2:$matchGen");

      if (matchGenNai != null) {
        genStr = matchGenNai.group(1)!.trim();
        debugPrint("原材料後1：$genStr");
      } else if (matchGen != null) {
        genStr = matchGen.group(1)!.trim();
        debugPrint("原材料後2：$genStr");
      }
    } else {
      print("else");
      genStr = contentMoji;
    }

    //、を見つけるまでを1要素として配列に格納する
    contentList = genStr.split('、');

    // contentに改行コードあり、「、」なしで文字列として代入
    content = content.replaceAll("、", "");

    debugPrint("読み込んだ文字：$contentList");

    result();
  }

  List<String> getContentList(){
    return contentList;
  }

  DBfood dbFood = DBfood();//DBクラスのインスタンス生成

  Future<List<String>> result() async {
    print("resultきた");
    List<String> values = [];
    List<String> result = [];
    List<String> list = getContentList();
    //データ全部持ってくる
    //ユーザが選択したデータ持ってくる
    Database db = await DBProvider.instance.database;
    List<Map<String, dynamic>> databaseContent = await db.rawQuery("SELECT foodname FROM food");
    //リスト変換する
    print("databaseContent：$databaseContent");

    List<Map<String, dynamic>> selectList = await db.rawQuery('SELECT hiragana FROM k_add where categoryid = ? ',['TS']); //現段階ではhiraganaのみ
    //リスト変換する
    print("selectList：$selectList");

    databaseContent.addAll(selectList);

    //　↓リスト型で回す
    for(Map<String, dynamic> dbc in databaseContent){
      for(String s in list) {
        String word = dbc['foodname'];
        if (s.contains(word)) {
          values.add(s);
          debugPrint("追加：　$s");
          debugPrint("表示： $values");
          break;
        }
      }
    }
    if(values.isEmpty){
      values.add("No");
      return values;
    }
    else{
      result = values;
      return result;
    }

  }

  // 文字認識結果とユーザ選択成分の照合
  Future<List<String>> verification() async{
    List<String> select = await AllObligationData().getValueCheck();
    select.addAll(await AllRecommendationData().getValueCheck2());
    select.addAll(await AllAnotherData().getValueCheck3());
    List<String> values = await Api.instance.result();
    print("verificationのvalues：$values");//ここ空になってるから変更しようね
    print("verificationのselect：$select");
    List<String> result = [];

    for(String str in select){
      for(String s in values) {
        print("values s:$s");
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

  /*void selectName(String UserName) async{

    Database db = await DBProvider.instance.database;
    DBlist dbList = DBlist();
    List<String> select = [];

    final selectList = await db.rawQuery('SELECT hiragana,kanji,eigo,otherName FROM k_add where categoryid = ?',['TS']);
    final int userid = await dbList.selectUserId(UserName);
    final foodId = await db.rawQuery('SELECT foodid FROM list where userid = ?',['TS']);

    for (Map<String, dynamic?> ad in selectList) {
      ad.forEach((key, value) {
        for (int x = 0; x < ad.length; x++) {
          print("キー：$key");
          if (key == 'hiragana') {
            select.add(value as String);
            debugPrint('AddListの内容：$select');
          }
        }
      });
    }
  }*/
}