import 'package:flutter/material.dart';

//import 'package:sotsuken2/CreateUser1.dart';
//import 'package:sotsuken2/CreateUser2.dart';
import 'package:sotsuken2/ui/ChooseUser.dart';

class AllUserData{
  //一時的に保持するとこ
  static String sUserName = "";

  //臨時
  static List<String> UserNameList = [];

  //他に要るなら後で

  void setUserName(String nam){
    sUserName = nam;
  }

  String getUserName(){
    return sUserName;
  }

  void setUserNameFinal(){
    debugPrint(sUserName);
    UserNameList.add(sUserName);
    debugPrint('Listのなかみ$UserNameList');
    sUserName = "";
  }

  List<String> getUserNames(){
    sUserName = "";
    return UserNameList;
  }

  void deleteUserName(String name){
    UserNameList.remove(name);
    debugPrint('Listのなかみ$UserNameList');
  }
//indexで誰の情報か紐づけで持ってくる
//後でdeleteもほしいね
}
