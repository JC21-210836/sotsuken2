import 'package:flutter/material.dart';
import 'package:sotsuken2/ui/Obligation_allergy.dart';


class AllRecommendationData{

  static List<bool> Boo2 = [];
  static List<String> IndexValue2 = ["あわび","いか","いくら","オレンジ","牛肉","ごま","さけ", "さば","大豆","鶏肉",
    "バナナ","豚肉","まつたけ","もも","やまいも","りんご","ゼラチン","アーモンド","カシューナッツ","キウイフルーツ"];
  static List<String> CheckValue2 = [];
  static String HRecommendation = "";

  void setRecommendationBool(List<bool> box){
    Boo2.clear();
    Boo2.addAll(box);
  }

  void HanteiRecommendation(){
    CheckValue2.clear();
    for(int x = 0;x < Boo2.length; x++){
      if(Boo2[x] == true){
        CheckValue2.add(IndexValue2[x]);
      }
    }
    debugPrint(CheckValue2.toString());
  }

  String getCheckValue2(){
    HRecommendation = "";
    for(int x = 0;x < CheckValue2.length; x++){
      if(x == 0 || x == CheckValue2.length){
        HRecommendation = '$HRecommendation${CheckValue2[x]}';
      }else{
        HRecommendation = '$HRecommendation\n${CheckValue2[x]}';
      }
    }
    debugPrint(HRecommendation);
    return HRecommendation;
  }

  void AllResetRecommendation(){
    Boo2 = [];
    CheckValue2 = [];
    HRecommendation = "";
  }
}