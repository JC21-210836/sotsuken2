import 'package:flutter/material.dart';

import '../DB/Database.dart';
import 'AllUserData.dart';

class AllAnotherData{

  static List<bool> boolList3 = [];
  static List<String> valueList3= [];
  static List<String> valueCheck3 = [];
  static String hAnother = "";


  void addMethod3(String nam) {
    valueList3.add(nam);
    boolList3.add(false);
    debugPrint(valueList3.toString());
  }


  List<String> getValue3() {
    return valueList3;
  }

  List<bool> getBool3() {
    return boolList3;
  }

  void HanteiAnother(){
    valueCheck3.clear();
    for(int x = 0;x < boolList3.length; x++){
      if(boolList3[x] == true){
        valueCheck3.add(valueList3[x]);
      }
    }
    debugPrint(valueCheck3.toString());
  }

  List<String> getValueCheck3(){
    return valueCheck3;
  }

  void setValueCheck3(List<String> dbValue){
    valueCheck3 =  dbValue;
  }

  String getValueCheckString3(){
    hAnother = "";
    for(int x = 0;x < valueCheck3.length; x++){
      if(x == 0 || x == valueCheck3.length){
        hAnother = '$hAnother${valueCheck3[x]}';
      }else{
        hAnother = '$hAnother\n${valueCheck3[x]}';
      }
    }
    return hAnother;
  }

  void AllResetAnother(){
    debugPrint(getValue3().length.toString());
  /*うまくいってない
    if(boolList3.isNotEmpty){
      boolList3 = [];
      for(int n = 1 ; n <= boolList3.length ; n++ ){
        boolList3.add(false);
      }
    }

   */
    valueCheck3 = [];
    hAnother = "";
  }

  //追加した処理12/21
  //追加成分のinsert処理
  static List<String> checkadd = [];//チェックされた追加名のリスト

  void insertAllResetAnother() async {
    debugPrint('insertAllResetAnotherに来ました');
    final dbProvider = DBProvider.instance;
    checkadd.clear();//前回のcheckaddをクリア
    checkadd = getValueCheck3();//新たにcheckされたデータを代入

    final int userid = await dbProvider.selectUserId(AllUserData.sUserName);// ユーザーIDを非同期で取得
    final int addid = await dbProvider.selectAddId(userid);//あるユーザが登録したaddidを取得

    debugPrint('参照したいuseridは:$userid');
    debugPrint('参照したいaddidは:$addid');

    for (int x = 0; x < checkadd.length; x++) {
      final result2 = await dbProvider.insertlistAdd(userid, addid);// リスト表へのinsert処理
      debugPrint('リスト表にinsert処理した内容:$result2');
    }
    debugPrint(checkadd.toString());
  }

/*
  String getValueString3() {
    debugPrint(valueList3.length.toString());
    return valueList3.toString();
  }

   */
}

