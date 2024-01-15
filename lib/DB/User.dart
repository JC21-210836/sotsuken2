import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../Data/AllUserData.dart';
import 'Database.dart';

class DBuser{

  //-ユーザ処理一覧-
  //ユーザの追加処理
  Future<int> insertUser(AllUserData row) async {
    debugPrint("insertUserにきました");
    Database db = await DBProvider.instance.database;
    return await db.insert('user', row.toMap());
  }

  //usernameを削除する
  Future deleteUser(String username) async {
    debugPrint('deleteUserにきました');
    Database db = await DBProvider.instance.database;
    return await db.delete('user', where: 'username = ?', whereArgs: [username],);
  }

  //usernameを更新する
  Future updateUser(String UserName,String afterName) async {
    debugPrint('updateUserにきました');
    Database db = await DBProvider.instance.database;
    final values = <String, String>{"username": afterName,};
    await db.update("user", values, where: "username=?", whereArgs: [UserName],);
  }

  //userId,userNameをlistに格納する処理
  static List<int> userId = [];
  static List<String> userName = [];
  Future<List<String>> selectlistUser() async {
    debugPrint("selectUserにきました");
    Database db = await DBProvider.instance.database;
    final userData = await db.query('user');
    userId.clear(); // リストを再度使用する前にクリアする
    userName.clear();
    for (Map<String, dynamic?> userMap in userData) {
      userMap.forEach((key, value) {
        if (key == 'userid') {
          userId.add(value as int);
        } else if (key == 'username') {
          userName.add(value as String);
        }
      });
    }
    return userName;
  }


}