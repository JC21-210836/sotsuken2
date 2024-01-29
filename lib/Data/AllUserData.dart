import '../DB/Database.dart';

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

  //みちるちゃんの領域
  final dbProvider = DBProvider.instance;

  late String username;

  AllUserData({
    required this.username,
  });

  AllUserData.newAllUserData(){
    username = "";
  }

  Map<String, String> toMap() =>{
    "username":username,
  };
//indexで誰の情報か紐づけで持ってくる
//後でdeleteもほしいね
}
